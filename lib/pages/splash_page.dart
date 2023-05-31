import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:responsi/providers/category_provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void getInit() async {
    await Provider.of<CategoryProvider>(context, listen: false).getCategory();
    Navigator.pushNamed(context, '/home');
  }

  void initState() {
    getInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
