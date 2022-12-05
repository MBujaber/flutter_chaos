import 'package:chaos_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
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
          ),
          ElevatedButton(
              child: Text("logout"),
              onPressed: () => context.read<AuthProvider>().logout()),
        ],
      ),
    );
  }
}
