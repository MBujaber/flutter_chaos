import 'package:chaos_app/models/category.dart';
import 'package:chaos_app/models/ingredient.dart';
import 'package:chaos_app/models/recipe.dart';
import 'package:chaos_app/providers/category_provider.dart';
import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/my_recipe_provider.dart';

class MyRecipeCard extends StatefulWidget {
  final Color? iconColor;
  const MyRecipeCard({required this.recipe, super.key, this.iconColor});
  final Recipe recipe;

  @override
  State<MyRecipeCard> createState() => _MyRecipeCardState();
}

class _MyRecipeCardState extends State<MyRecipeCard> {
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
              height: 120,
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
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        onTap: () =>
                            context.push('/editmyrecipe', extra: widget.recipe),
                        child: Icon(
                          Icons.edit,
                        ),
                      ),
                      InkWell(
                        onTap: () => context
                            .read<MyRecipeProvider>()
                            .deleteMyRecipes(widget.recipe.id),
                        child: Icon(
                          Icons.delete,
                          color: widget.iconColor ?? Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
