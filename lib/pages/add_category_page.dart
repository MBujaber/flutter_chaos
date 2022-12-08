import 'dart:io';
import 'package:chaos_app/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({super.key});

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  final titleController = TextEditingController();

  File? imageFile;

  String? imageError;

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Create New Category")),
        body: SafeArea(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: titleController,
                    decoration: InputDecoration(hintText: "Category name"),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Field is required";
                      }

                      return null;
                    },
                  ),
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
                        await context.read<CategoryProvider>().addCategory(
                              title: titleController.text,
                              image: imageFile!,
                            );
                        context.pop();
                      }
                    },
                    child: Text("Add Category"))
              ],
            ),
          ),
        ));
  }
}
