import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddIngredientPage extends StatefulWidget {
  const AddIngredientPage({super.key});

  @override
  State<AddIngredientPage> createState() => _AddIngredientPageState();
}

class _AddIngredientPageState extends State<AddIngredientPage> {
  final titleController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create New Ingredient")),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: InputDecoration(hintText: "Title"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    return null;
                  },
                ),
                ElevatedButton(
                    onPressed: () async {
                      // form

                      if (formKey.currentState!.validate()) {
                        await context
                            .read<IngredientProvider>()
                            .addIngredient(title: titleController.text);
                        context.push('/ingredient');
                        // context.pop();
                        print("done");
                      }
                    },
                    child: Text("Add Ingredient"))
              ],
            ),
          ),
        ));
  }
}
