import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsi/pages/home_page.dart';
import 'package:responsi/pages/splash_page.dart';
import 'package:responsi/providers/category_provider.dart';
import 'package:responsi/providers/dessert_provider.dart';
import 'package:responsi/providers/recipe_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => DessertProvider()),
        ChangeNotifierProvider(create: (context) => RecipeProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        routes: {
          '/': (context) => SplashPage(),
          '/home': (context) => HomePage(),
        },
      ),
    );
  }
}
