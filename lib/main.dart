import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/model/IngredientList.dart';
import 'package:recipes/pages/HomePage.dart';
import 'package:recipes/pages/LoginPage.dart';
import 'package:recipes/provider/MealsProvider.dart';
import 'package:recipes/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MealFavoriotesProdider(),
        )
      ],
      child: MaterialApp(
          color: appColor,
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.deepOrange),
          home: const LoginPage()),
    );
  }
}
