import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../services/client.dart';
import '../models/recipe.dart';

class RecipeProvider extends ChangeNotifier {
  List<Recipe> recipes = [];

  RecipeProvider() {
    loadRecipes();
  }

  Future<void> loadRecipes() async {
    recipes.clear();

    var response = await Client.dio.get("/recipe/");
    var recipeJsonList = response.data as List;

    recipes =
        recipeJsonList.map((recipeJson) => Recipe.fromMap(recipeJson)).toList();

    notifyListeners();
  }
}
