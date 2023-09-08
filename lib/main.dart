import 'package:flutter/material.dart';
import 'package:recipes/model/IngredientList.dart';
import 'package:recipes/pages/HomePage.dart';

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
    IngredientsListData.fetchMealsIngredient("soup")
        .then((value) => print(value));
    return const MaterialApp(
        color: Colors.pink,
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
