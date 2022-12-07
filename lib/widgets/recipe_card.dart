import 'package:chaos_app/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;
  const RecipeCard({Key? key, required this.recipe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              recipe.image,
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
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(recipe.title),
                  ),

                  Text(recipe.ingredient.toString()),
                  Text(recipe.category.toString()),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
