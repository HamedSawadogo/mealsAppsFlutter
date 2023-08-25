import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/model/mealsData.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: Meal.favorites.length,
        itemBuilder: (context, index) {
          final Meal meal = Meal.getMeal(index);
          return ListTile(
            leading: Image.network(meal.imageUrl),
            title: Text(meal.categorie),
            trailing: Icon(Icons.more_horiz),
          );
        },
      ),
    );
  }
}
