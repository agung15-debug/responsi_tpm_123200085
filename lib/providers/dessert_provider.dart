import 'package:flutter/material.dart';
import 'package:responsi/models/dessert_model.dart';
import 'package:responsi/services/dessert_service.dart';

class DessertProvider with ChangeNotifier {
  List<DessertModel> _dessert = [];
  List<DessertModel> get dessert => _dessert;
  set dessert(List<DessertModel> dessert) {
    _dessert = dessert;
    notifyListeners();
  }

  Future<void> getDessert(String Dessert) async {
    try {
      List<DessertModel> dessert = await DessertService().getDessert(Dessert);
      _dessert = dessert;
    } catch (e) {
      print(e);
    }
  }
}
