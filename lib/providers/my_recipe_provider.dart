import 'package:flutter/material.dart';
import '../services/client.dart';
import '../models/recipe.dart';

class MyRecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [];
  bool isLoading = false;

  MyRecipeProvider() {
    loadMyRecipes();
  }

  Future<void> loadMyRecipes() async {
    isLoading = true;
    recipes.clear();

    var response = await Client.dio.get("/myrecipe/");
    var recipeJsonList = response.data as List;

    recipes =
        recipeJsonList.map((recipeJson) => Recipe.fromMap(recipeJson)).toList();

    isLoading = false;
    notifyListeners();
  }
}
