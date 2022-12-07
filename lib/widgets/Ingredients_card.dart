import 'package:chaos_app/models/ingredient.dart';
import 'package:flutter/material.dart';

class IngredientsCard extends StatelessWidget {
  final Color? iconColor;
  const IngredientsCard({required this.ingredient, super.key, this.iconColor});

  final Ingredient ingredient;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(ingredient.title),
      // trailing: Column(
      //   children: [
      //     InkWell(
      //       onTap: () {},
      //       child: Icon(
      //         Icons.delete,
      //         color: iconColor ?? Colors.red,
      //       ),
      //     ),
      //     InkWell(
      //       onTap: () {},
      //       child: Icon(
      //         Icons.edit,
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
