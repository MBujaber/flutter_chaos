import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/my_recipe_provider.dart';
import '../widgets/drawer.dart';
import '../widgets/my_recipe_card.dart';

class MyRecipePage extends StatefulWidget {
  const MyRecipePage({Key? key}) : super(key: key);

  @override
  State<MyRecipePage> createState() => _MyRecipePageState();
}

class _MyRecipePageState extends State<MyRecipePage> {
  @override
  void initState() {
    super.initState();
    context.read<MyRecipeProvider>().loadMyRecipes();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("My Recipes"),
      ),
      body: context.watch<MyRecipeProvider>().isLoading
          ? Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () async {
                context.read<MyRecipeProvider>().loadMyRecipes();
              },
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoButton.filled(
                        onPressed: () {
                          context.push('/addrecipe');
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(0.0),
                          child: Text("Create New Recipe"),
                        ),
                      ),
                    ),
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
                            itemCount: context
                                .watch<MyRecipeProvider>()
                                .recipes
                                .length,
                            itemBuilder: (context, index) => MyRecipeCard(
                              recipe: context
                                  .watch<MyRecipeProvider>()
                                  .recipes[index],
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
