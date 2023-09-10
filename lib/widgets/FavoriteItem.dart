import 'package:animated_react_button/animated_react_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/provider/MealsProvider.dart';

class FavoriteItem extends StatefulWidget {
  const FavoriteItem({super.key, required this.meal});
  final Meal meal;
  @override
  State<FavoriteItem> createState() => _FavoriteItemState();
}

class _FavoriteItemState extends State<FavoriteItem> {
  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed: () {
      setState(() {
        Provider.of<MealFavoriotesProdider>(context, listen: false)
            .addFavorite(widget.meal);
      });
    }, icon: Consumer<MealFavoriotesProdider>(builder: (context, value, child) {
      return Container(
          child: AnimatedReactButton(
              iconSize: 33,
              defaultColor: Colors.grey,
              reactColor: Colors.red,
              onPressed: () async {
                Provider.of<MealFavoriotesProdider>(context, listen: false)
                    .addFavorite(widget.meal);
                await Future.delayed(Duration(seconds: 1));
              }));
    }));
  }
}
