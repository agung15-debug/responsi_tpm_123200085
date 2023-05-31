import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsi/providers/category_provider.dart';
import '../providers/dessert_provider.dart';
import 'dessert_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryProvider categoryProvider = Provider.of<CategoryProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text('Meal Category',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget content() {
      return Container(
          child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: categoryProvider.category.length,
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
                        await Provider.of<DessertProvider>(context,
                                listen: false)
                            .getDessert(
                                categoryProvider.category[index].strCategory!);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DesserPage(
                                    dessert: categoryProvider
                                        .category[index].strCategory!)));
                      },
                      title: Text(categoryProvider.category[index].strCategory!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      leading: Image.network(
                          categoryProvider.category[index].strCategoryThumb!),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ));
    }

    return ListView(
      children: [
        header(),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: content())
      ],
    );
  }
}
