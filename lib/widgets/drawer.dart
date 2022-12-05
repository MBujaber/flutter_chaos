import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class AppDrawer extends StatefulWidget {
  AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: context.watch<AuthProvider>().username != null
                ? Text('Welcome ${context.watch<AuthProvider>().username}')
                : Text('Register or Log in to gain more access!'),
          ),
          if (context.watch<AuthProvider>().username == null)
            ListTile(
              title: Text('Log in'),
              onTap: () {
                context.push('/login');
              },
            ),
          if (context.watch<AuthProvider>().username == null)
            ListTile(
              title: Text('Register'),
              onTap: () {
                context.push('/register');
              },
            ),
          if (context.watch<AuthProvider>().username != null)
            ListTile(
              title: Text('My Recipes'),
              onTap: () {},
            ),
          if (context.watch<AuthProvider>().username != null)
            ListTile(
              title: Text('Create a Recipe'),
              onTap: () {},
            ),
          if (context.watch<AuthProvider>().username != null)
            ListTile(
              title: Text('Add an ingredient'),
              onTap: () {},
            ),
          if (context.watch<AuthProvider>().username != null)
            ListTile(
              title: Text('Log out'),
              onTap: () {
                context.read<AuthProvider>().logout();
              },
            ),
        ],
      ),
    );
  }
}
