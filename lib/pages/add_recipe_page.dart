import 'dart:io';
import 'package:chaos_app/models/ingredient.dart';
import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';
import '../models/category.dart';
import '../providers/category_provider.dart';
import '../providers/my_recipe_provider.dart';

class AddRecipePage extends StatefulWidget {
  const AddRecipePage({super.key});

  @override
  State<AddRecipePage> createState() => _AddRecipePageState();
}

class _AddRecipePageState extends State<AddRecipePage> {
  final titleController = TextEditingController();
  final ingredientController = TextEditingController();

  Category? value;

  List<Ingredient> selectedIngredients = [];

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
              // TextFormField(
              //   controller: ingredientController,
              //   decoration: InputDecoration(hintText: "ingredient"),
              //   validator: (value) {
              //     if (value == null || value.isEmpty) {
              //       return "Field is required";
              //     }

              //     if (value.length <= 0) {
              //       return "Description too short";
              //     }

              //     return null;
              //   },
              // ),
              MultiSelectDialogField(
                items: context
                    .watch<IngredientProvider>()
                    .ingredients
                    .map((e) => MultiSelectItem(e, e.title))
                    .toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  selectedIngredients = values;
                  print(selectedIngredients.map((e) => e.id).join(", "));
                },
              ),
              DropdownButton<Category>(
                  value: value,
                  items: context
                      .watch<CategoryProvider>()
                      .categories
                      .map(buildMenuItem)
                      .toList(),
                  onChanged: (value) => setState(
                        () {
                          this.value = value;
                        },
                      )),
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

                    if (formKey.currentState!.validate() && imageFile != null) {
                      await context.read<MyRecipeProvider>().addRecipe(
                            title: titleController.text,
                            selectedIngredients: selectedIngredients,
                            category: value!.id,
                            image: imageFile!,
                          );

                      context.push('/myrecipe');
                    }
                  },
                  child: Text("Add Recipe"))
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<Category> buildMenuItem(Category item) => DropdownMenuItem(
        value: item,
        child: Text(item.title),
      );
}

void a() {
  var l = [4, 9, 0].join(","); // "4_9_0"
}
