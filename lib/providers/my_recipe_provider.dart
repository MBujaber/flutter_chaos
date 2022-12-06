import 'dart:io';

import 'package:dio/dio.dart';
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

  void deleteMyRecipes(int id) async {
    await Client.dio.delete('/recipe/delete/$id/');
    loadMyRecipes();
  }

  Future<void> addRecipe({
    required String title,
    required String ingredient,
    required String category,
    required File image,
  }) async {
    var response = await Client.dio.post("/recipe/create/",
        data: FormData.fromMap({
          "title": title,
          "ingredient": ingredient,
          "category": category,
          "image": await MultipartFile.fromFile(image.path),
        }));

    loadMyRecipes();
  }

  addCategory({required String title, required File image}) {}
}
