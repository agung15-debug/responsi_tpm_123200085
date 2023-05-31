import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsi/models/category_model.dart';

class CategoryService {
  String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<CategoryModel>> getCategory() async {
    var url = '$baseUrl/categories.php';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['categories'];
      List<CategoryModel> category =
          data.map((item) => CategoryModel.fromJson(item)).toList();
      return category;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
