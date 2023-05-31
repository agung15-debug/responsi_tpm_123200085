import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsi/models/recipe_model.dart';

class RecipeService {
  String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<RecipeModel>> getRecipe(String id) async {
    var url = '$baseUrl/lookup.php?i=$id';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['meals'];
      List<RecipeModel> recipe =
          data.map((item) => RecipeModel.fromJson(item)).toList();
      return recipe;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
