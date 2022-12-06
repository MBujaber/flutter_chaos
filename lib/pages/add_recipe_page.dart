import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../providers/my_recipe_provider.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final titleController = TextEditingController();
  final ingredientController = TextEditingController();
  final categoryController = TextEditingController();

  File? imageFile;

  String? imageError;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create New Recipe")),
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
                TextFormField(
                  controller: ingredientController,
                  decoration: InputDecoration(hintText: "ingredient"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    if (value.length <= 0) {
                      return "Description too short";
                    }

                    return null;
                  },
                ),
                TextFormField(
                  controller: categoryController,
                  decoration: InputDecoration(hintText: "category"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Field is required";
                    }

                    if (double.tryParse(value) == null) {
                      return "Must be number";
                    }

                    return null;
                  },
                ),
                if (imageFile != null)
                  Image.file(
                    imageFile!,
                    width: 100,
                    height: 100,
                  )
                else
                  Container(
                    width: 100,
                    height: 100,
                  ),
                ElevatedButton(
                    onPressed: () async {
                      var file = await ImagePicker()
                          .pickImage(source: ImageSource.gallery);

                      if (file == null) {
                        print("Use didnt select a file");
                        return;
                      }

                      setState(() {
                        imageFile = File(file.path);
                        imageError = null;
                      });
                    },
                    child: Text("Add Image")),
                if (imageError != null)
                  Text(
                    imageError!,
                    style: TextStyle(color: Colors.red),
                  ),
                Spacer(),
                ElevatedButton(
                    onPressed: () async {
                      // form

                      if (imageFile == null) {
                        setState(() {
                          imageError = "Required field";
                        });
                      }

                      if (formKey.currentState!.validate() &&
                          imageFile != null) {
                        await context.read<MyRecipeProvider>().addRecipe(
                              title: titleController.text,
                              ingredient: ingredientController.text,
                              category: categoryController.text,
                              image: imageFile!,
                            );
                        context.pop();
                      }
                    },
                    child: Text("Add Recipe"))
              ],
            ),
          ),
        ));
  }
}
