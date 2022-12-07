import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:chaos_app/widgets/ingredients_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chaos_app/widgets/drawer.dart';

class IngredientPage extends StatefulWidget {
  const IngredientPage({Key? key}) : super(key: key);

  @override
  State<IngredientPage> createState() => _IngredientPageState();
}

class _IngredientPageState extends State<IngredientPage> {
  @override
  void initState() {
    super.initState();
    context.read<IngredientProvider>().loadIngredients();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(title: Text("Ingredient List")),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
      body: context.watch<IngredientProvider>().isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: context.watch<IngredientProvider>().ingredients.length,
              itemBuilder: (context, index) => IngredientsCard(
                ingredient:
                    context.watch<IngredientProvider>().ingredients[index],
              ),
            ),
    );
  }
}
