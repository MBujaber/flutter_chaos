import 'package:chaos_app/pages/add_category_page.dart';
import 'package:chaos_app/pages/add_ingredient_page.dart';
import 'package:chaos_app/pages/add_recipe_page.dart';
import 'package:chaos_app/pages/edit_recipe_page.dart';
import 'package:chaos_app/pages/home.dart';
import 'package:chaos_app/pages/category_page.dart';
import 'package:chaos_app/pages/ingredient_page.dart';
import 'package:chaos_app/pages/login_page.dart';
import 'package:chaos_app/pages/my_recipe_page.dart';
import 'package:chaos_app/pages/recipe_page.dart';
import 'package:chaos_app/pages/register_page.dart';
import 'package:chaos_app/providers/auth_provider.dart';
import 'package:chaos_app/providers/category_provider.dart';
import 'package:chaos_app/providers/ingredient_provider.dart';
import 'package:chaos_app/providers/my_recipe_provider.dart';
import 'package:chaos_app/providers/recipe_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'models/recipe.dart';

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
      path: '/addcategory',
      builder: (context, state) => AddCategoryPage(),
    ),
    GoRoute(
      path: '/recipe',
      builder: (context, state) => RecipePage(),
    ),
    GoRoute(
      path: '/myrecipe',
      builder: (context, state) => MyRecipePage(),
    ),
    GoRoute(
      path: '/addrecipe',
      builder: (context, state) => AddRecipePage(),
    ),
    GoRoute(
      path: '/editmyrecipe',
      builder: (context, state) => EditRecipePage(
        recipe: state.extra as Recipe,
      ),
    ),
    GoRoute(
      path: '/ingredient',
      builder: (context, state) => IngredientPage(),
    ),
    GoRoute(
      path: '/addingredient',
      builder: (context, state) => AddIngredientPage(),
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
        ),
        ChangeNotifierProvider(
          create: (context) => IngredientProvider(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        routerConfig: router,
      ),
    );
  }
}
