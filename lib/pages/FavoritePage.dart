import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/pages/Details.dart';
import 'package:recipes/provider/MealsProvider.dart';
import '../widgets/FavoriteMealItem.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    MealFavoriotesProdider provider =
        Provider.of<MealFavoriotesProdider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('favorites (${provider.favoritesMeals().length})'),
        ),
        body: ListView.builder(
            itemCount: provider.favoritesMeals().length,
            itemBuilder: (context, index) {
              final Meal meal = provider.favoritesMeals()[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DetailsPage(meal: meal),
                  ));
                },
                child: Stack(
                  children: [
                    Dismissible(
                        movementDuration: const Duration(seconds: 1),
                        key: Key(meal.id),
                        onDismissed: (direction) {
                          setState(() {
                            provider.favoritesMeals().removeAt(index);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.all(10.0),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                        child: FavoriteMealItem(meal: meal))
                  ],
                ),
              );
            }));
  }
}
