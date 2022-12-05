import 'package:chaos_app/pages/home.dart';
import 'package:chaos_app/pages/category_page.dart';
import 'package:chaos_app/pages/login_page.dart';
import 'package:chaos_app/pages/my_recipe_page.dart';
import 'package:chaos_app/pages/recipe_page.dart';
import 'package:chaos_app/pages/register_page.dart';
import 'package:chaos_app/providers/auth_provider.dart';
import 'package:chaos_app/providers/category_provider.dart';
import 'package:chaos_app/providers/my_recipe_provider.dart';
import 'package:chaos_app/providers/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var authProvider = AuthProvider();

  var isAuth = await authProvider.hasToken();

  print("isAuth $isAuth");

  runApp(MyApp(
    authProvider: authProvider,
  ));
}

final router = GoRouter(
  initialLocation: '/category',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => Home(),
    ),
    GoRoute(
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      path: '/category',
      builder: (context, state) => CategoryPage(),
    ),
    GoRoute(
      path: '/recipe',
      builder: (context, state) => RecipePage(),
    ),
    GoRoute(
      path: '/myrecipe',
      builder: (context, state) => MyRecipePage(),
    ),
  ],
);

class MyApp extends StatelessWidget {
  final AuthProvider authProvider;
  MyApp({
    required this.authProvider,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => authProvider,
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyRecipeProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoryProvider(),
        )
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
    );
  }
}
