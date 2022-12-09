import 'package:chaos_app/models/recipe.dart';
import 'package:chaos_app/providers/recipe_provider.dart';
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
  List<Ingredient> ingredientsTitle = [];

  @override
  void initState() {
    super.initState();

    category = context
        .read<CategoryProvider>()
        .categories
        .firstWhere((element) => element.id == widget.recipe.category);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 7,
      margin: EdgeInsets.all(4),
      // shadowColor: Colors.indigo,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Image.network(
              widget.recipe.image,
              height: 150,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text(category.title),
                  Text(
                    widget.recipe.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Text(ingredientsTitle.toString()),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text('Category: ${category!.title.toString()}'),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 30,
                      width: 30,
                      child: Text(
                        "Ingredient: ${context.watch<IngredientProvider>().ingredients.where((element) => widget.recipe.ingredient.contains(element.id)).toList().map((e) => e.title).join(' - ')}",
                        // child: Text(
                        //   context
                        //       .watch<IngredientProvider>()
                        //       .ingredients
                        //       .where((element) =>
                        //           widget.recipe.ingredient.contains(element.id))
                        //       .toList()
                        //       .map((e) => e.title)
                        //       .join(' - '),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
