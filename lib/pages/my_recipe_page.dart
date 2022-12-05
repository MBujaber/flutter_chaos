import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../widgets/my_recipe_card.dart';
import '../widgets/recipe_card.dart';
import '../providers/recipe_provider.dart';

class MyRecipePage extends StatelessWidget {
  const MyRecipePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recipes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoButton.filled(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(0.0),
                  child: Text("Create New Recipe"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height),
                  ),
                  physics: const NeverScrollableScrollPhysics(), // <- Here
                  itemCount: context.watch<RecipeProvider>().recipes.length,
                  itemBuilder: (context, index) => MyRecipeCard(
                      recipe: context.watch<RecipeProvider>().recipes[index])),
            ),
          ],
        ),
      ),
    );
  }
}
