import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:responsi/models/dessert_model.dart';

class DessertService {
  String baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<DessertModel>> getDessert(String Dessert) async {
    var url = '$baseUrl/filter.php?c=$Dessert';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['meals'];
      List<DessertModel> dessert =
          data.map((item) => DessertModel.fromJson(item)).toList();
      return dessert;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
