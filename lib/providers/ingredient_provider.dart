import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/client.dart';
import '../models/ingredient.dart';

class IngredientProvider extends ChangeNotifier {
  List<Ingredient> ingredients = [];
  bool isLoading = false;

  IngredientProvider() {
    loadIngredients();
  }

  Future<void> loadIngredients() async {
    isLoading = true;
    ingredients.clear();

    var response = await Client.dio.get("/ingredient/");
    var ingredientJsonList = response.data as List;

    ingredients = ingredientJsonList
        .map((ingredientJson) => Ingredient.fromMap(ingredientJson))
        .toList();

    isLoading = false;
    notifyListeners();
  }

  Future<void> addIngredient({
    required String title,
  }) async {
    var response = await Client.dio.post("/ingredient/create/",
        data: FormData.fromMap({
          "title": title,
        }));

    loadIngredients();
  }
}
