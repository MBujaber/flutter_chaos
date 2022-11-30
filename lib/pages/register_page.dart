import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              TextFormField(
                controller: usernameController,
                decoration: InputDecoration(hintText: "Username"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(hintText: "Confirm Password"),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Required field";
                  }

                  if (passwordController.text != value) {
                    return "Password doesn't match";
                  }

                  return null;
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    var didRegister = await context
                        .read<AuthProvider>()
                        .register(
                            username: usernameController.text,
                            password: passwordController.text);
                    if (didRegister) {
                      context.go("/");
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Registration unsuccessful"),
                        ),
                      );
                    }
                  } else {
                    print("form not valid");
                  }
                },
                child: Text("Register"),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
