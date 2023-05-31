import 'package:flutter/material.dart';
import 'package:responsi/models/category_model.dart';
import 'package:responsi/services/category_service.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryModel> _category = [];
  List<CategoryModel> get category => _category;
  set category(List<CategoryModel> category) {
    _category = category;
    notifyListeners();
  }

  Future<void> getCategory() async {
    try {
      List<CategoryModel> category = await CategoryService().getCategory();
      _category = category;
    } catch (e) {
      print(e);
    }
  }
}
