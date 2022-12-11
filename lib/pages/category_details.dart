import 'package:chaos_app/models/category.dart';
import 'package:chaos_app/models/recipe.dart';

import 'package:chaos_app/providers/category_provider.dart';
import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:chaos_app/providers/recipe_provider.dart';
import 'package:chaos_app/widgets/Ingredients_card.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:chaos_app/widgets/drawer.dart';

class DetailsCategory extends StatefulWidget {
  DetailsCategory({super.key});
  // final Category category;
  @override
  State<DetailsCategory> createState() => _DetailsCategoryState();
}

class _DetailsCategoryState extends State<DetailsCategory> {
  @override
  Recipe? recipe;
  void initState() {
    super.initState();

    //   recipe = context
    //       .watch<RecipeProvider>()
    //       .recipes
    //       .firstWhere((element) => element.category == widget.category.id);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Category Details")),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      // body: context.watch<IngredientProvider>().isLoading
      //     ? Center(
      //         child: CircularProgressIndicator(),
      //       )
      //     : ListView.builder(
      //         itemCount: context.watch<IngredientProvider>().ingredients.length,
      //         itemBuilder: (context, index) => IngredientsCard(
      //           ingredient:
      //               context.watch<IngredientProvider>().ingredients[index],
      //         ),
      //       ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text("back"),
          ),
          Text("")
        ],
      ),
    );
  }
}
