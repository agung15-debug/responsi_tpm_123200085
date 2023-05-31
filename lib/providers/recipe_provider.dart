import 'package:flutter/material.dart';
import 'package:responsi/models/recipe_model.dart';
import 'package:responsi/services/recipe_service.dart';

class RecipeProvider with ChangeNotifier{
  List<RecipeModel> _recipe = [];
  List<RecipeModel> get recipe => _recipe;
  set recipe(List<RecipeModel> recipe){
    _recipe = recipe;
    notifyListeners();
  }

  Future<void> getRecipe(String id) async {
    try{
      List<RecipeModel> recipe = await RecipeService().getRecipe(id);
      _recipe = recipe;
    }catch(e){
      print(e);
    }
  }
}