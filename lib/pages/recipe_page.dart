import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsi/providers/recipe_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of<RecipeProvider>(context);
    Widget header() {
      return AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Meal Detail',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
      );
    }

    Widget content() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              child: Text(recipeProvider.recipe[0].strMeal!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  recipeProvider.recipe[0].strMealThumb!,
                  height: 300,
                  width: 300,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text('Category : ' + recipeProvider.recipe[0].strCategory!,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            child: Text('Area : ' + recipeProvider.recipe[0].strArea!,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            child: Text('Tags : ' + recipeProvider.recipe[0].strTags!,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Text('Instructions : ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(recipeProvider.recipe[0].strInstructions!),
              ],
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              var url = recipeProvider.recipe[0].strYoutube!;
              if (await canLaunchUrl(Uri.parse(url))) {
                await launchUrl(Uri.parse(url));
              } else {
                throw 'Could not launch $url';
              }
            },
            child: Text(
              'Youtube Video',
              style: TextStyle(fontSize: 16),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              minimumSize: Size.fromHeight(50),
            ),
          ),
        ],
      );
    }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: header(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: content(),
          ),
        ));
  }
}
