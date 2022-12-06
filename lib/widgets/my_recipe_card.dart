import 'package:chaos_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/my_recipe_provider.dart';

class MyRecipeCard extends StatelessWidget {
  final Color? iconColor;
  const MyRecipeCard({required this.recipe, super.key, this.iconColor});
  final Recipe recipe;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      InkWell(
                        onTap: () => context
                            .read<MyRecipeProvider>()
                            .deleteMyRecipes(recipe.id),
                        child: Icon(
                          Icons.delete,
                          color: iconColor ?? Colors.red,
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
