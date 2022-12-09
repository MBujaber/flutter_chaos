import 'package:chaos_app/models/category.dart';
import 'package:chaos_app/providers/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              category.image,
              fit: BoxFit.fitHeight,
              width: double.infinity,
            ),
          ),
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Text(category.title),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/detailscategory');
                    },
                    child: Text(category.title),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
