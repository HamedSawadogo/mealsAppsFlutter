import 'package:flutter/material.dart';
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
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        color: Colors.pink,
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}
