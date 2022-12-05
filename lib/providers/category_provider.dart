import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/client.dart';
import '../models/category.dart';

class CategoryProvider extends ChangeNotifier {
  List<Category> categories = [];

  CategoryProvider() {
    loadCategories();
  }

  Future<void> loadCategories() async {
    categories.clear();

    var response = await Client.dio.get("/category/");
    var categoryJsonList = response.data as List;

    categories = categoryJsonList
        .map((categoryJson) => Category.fromMap(categoryJson))
        .toList();

    notifyListeners();
  }
}
