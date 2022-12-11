import 'package:chaos_app/models/recipe.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';
import '../widgets/recipe_card.dart';
import '../providers/recipe_provider.dart';

class RecipePage extends StatefulWidget {
  const RecipePage({Key? key}) : super(key: key);

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  void initState() {
    super.initState();
    context.read<RecipeProvider>().loadRecipes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("All Recipes"),
      ),
      body: context.watch<RecipeProvider>().isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                context.read<RecipeProvider>().loadRecipes();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: LayoutBuilder(
                        builder: (context, c) {
                          return GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 400,
                              childAspectRatio: 0.8,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                            ),
                            physics:
                                const NeverScrollableScrollPhysics(), // <- Here
                            itemCount:
                                context.watch<RecipeProvider>().recipes.length,
                            itemBuilder: (context, index) => InkWell(
                              onTap: () {
                                context.push(
                                  '/detailsrecipe',
                                  extra: context
                                      .read<RecipeProvider>()
                                      .recipes[index],
                                );
                              },
                              child: RecipeCard(
                                recipe: context
                                    .watch<RecipeProvider>()
                                    .recipes[index],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
