import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:chaos_app/widgets/ingredients_card.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:chaos_app/widgets/drawer.dart';

class DetailsCategory extends StatefulWidget {
  const DetailsCategory({Key? key}) : super(key: key);

  @override
  State<DetailsCategory> createState() => _DetailsCategoryState();
}

class _DetailsCategoryState extends State<DetailsCategory> {
  @override
  void initState() {
    super.initState();
    context.read<IngredientProvider>().loadIngredients();
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
        ],
      ),
    );
  }
}
