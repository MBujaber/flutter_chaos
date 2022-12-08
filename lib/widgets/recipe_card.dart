import 'package:chaos_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/category.dart';
import '../models/ingredient.dart';
import '../providers/category_provider.dart';
import '../providers/ingredient_provider.dart';

class RecipeCard extends StatefulWidget {
  final Recipe recipe;
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  State<RecipeCard> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  Category? category;
  List<Ingredient> ingredients = [];
  List<Ingredient> ingredientsTitle = [];

  @override
  void initState() {
    super.initState();

    category = context
        .read<CategoryProvider>()
        .categories
        .firstWhere((element) => element.id == widget.recipe.category);

    ingredients = context
        .read<IngredientProvider>()
        .ingredients
        .where((element) => element.id == widget.recipe.ingredient)
        .toList();

    ingredientsTitle = ingredients
        .map(
          (e) => e.title,
        )
        .cast<Ingredient>()
        .toList();

    // ingredientController.text = widget.recipe.ingredient as String;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.indigo,
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              widget.recipe.image,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text(category.title),
                  Text(widget.recipe.title,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                  Text(ingredientsTitle.toString()),
                  Text(widget.recipe.ingredient.toString()),
                  Text('Category: ${category!.title.toString()}'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
