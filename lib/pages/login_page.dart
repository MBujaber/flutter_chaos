import 'package:chaos_app/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text("Log in"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(hintText: 'Username'),
              controller: usernameController,
            ),
            TextField(
              decoration: const InputDecoration(hintText: 'Password'),
              controller: passwordController,
              obscureText: true,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 22),
              child: ElevatedButton(
                onPressed: () async {
                  // var authProvider = Provider.of<AuthProvider>(context, listen: false);
                  var success = await context.read<AuthProvider>().login(
                      username: usernameController.text,
                      password: passwordController.text);
                  // username: usernameController.text,
                  // password: passwordController.text));
                  print("++++");
                  print(success);
                  print("=====");

                  if (success) {
                    context.pop();
                    print("login successful"); // for testing
                  } else
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.red,
                        content: Text("login unsuccessful"),
                      ),
                    );
                },
                child: const Text("Login"),
              ),
            ),
            CupertinoButton(
              onPressed: () => context.replace('/register'),
              child: Text("Register"),
            )
          ],
        ),
      ),
    );
  }
}
