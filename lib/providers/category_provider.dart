import 'package:flutter/material.dart';
import '../services/client.dart';
import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];
  bool isLoading = false;

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    isLoading = true;
    categories.clear();

    var response = await Client.dio.get("/category/");
    var categoryJsonList = response.data as List;

    categories = categoryJsonList
        .map((categoryJson) => Category.fromMap(categoryJson))
        .toList();

    isLoading = false;
    notifyListeners();
  }
}
