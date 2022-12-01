import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () => context.push('/login'),
              child: Text("login"),
            ),
          ),
          ElevatedButton(
            child: Text("Register"),
            onPressed: () => context.push('/register'),
          )
        ],
      ),
    );
  }
}
