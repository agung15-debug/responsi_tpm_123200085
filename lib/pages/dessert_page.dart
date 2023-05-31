import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsi/pages/recipe_page.dart';
import 'package:responsi/providers/dessert_provider.dart';

import '../providers/recipe_provider.dart';

class DesserPage extends StatefulWidget {
  const DesserPage({super.key, required this.dessert});
  final String dessert;

  @override
  State<DesserPage> createState() => _DesserPageState();
}

class _DesserPageState extends State<DesserPage> {
  @override
  Widget build(BuildContext context) {
    DessertProvider dessertProvider = Provider.of<DessertProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(widget.dessert + ' Meals',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
      );
    }

    Widget content() {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: Container(
          child: ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: dessertProvider.dessert.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(top: index == 0 ? 0 : 10),
                  child: Card(
                    child: Container(
                      height: 75,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () async {
                              await Provider.of<RecipeProvider>(context,
                                      listen: false)
                                  .getRecipe(
                                      dessertProvider.dessert[index].idMeal!);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RecipePage(
                                          id: dessertProvider
                                              .dessert[index].idMeal!)));
                            },
                            title: Text(dessertProvider.dessert[index].strMeal!,
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                  dessertProvider.dessert[index].strMealThumb!),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
      );
    }

    return ListView(
      children: [
        header(),
        content(),
      ],
    );
  }
}
