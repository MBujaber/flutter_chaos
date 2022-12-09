import 'package:chaos_app/models/category.dart';
import 'package:chaos_app/models/ingredient.dart';
import 'package:chaos_app/models/recipe.dart';
import 'package:chaos_app/providers/category_provider.dart';
import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsRecipe extends StatefulWidget {
  DetailsRecipe({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<DetailsRecipe> createState() => _DetailsRecipeState();
}

class _DetailsRecipeState extends State<DetailsRecipe> {
  @override
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipe.title),
      ),
      body: Column(
        children: [
          Image.network(
            widget.recipe.image,
            height: 400,
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Category: ',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  '${category!.title.toString()}',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Ingredient: ",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.visible,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "${context.watch<IngredientProvider>().ingredients.where((element) => widget.recipe.ingredient.contains(element.id)).toList().map((e) => e.title).join(' - ')}",
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.normal),
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
