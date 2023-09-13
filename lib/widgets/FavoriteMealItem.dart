import 'package:flutter/material.dart';
import 'package:recipes/utils/constants.dart';
import '../model/Meal.dart';

class FavoriteMealItem extends StatelessWidget {
  const FavoriteMealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Row(children: [
        Expanded(
            child: Hero(
          tag: meal.id,
          child: SizedBox(
              height: 80,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              )),
        )),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: title,
                ),
                Text(meal.categorie, style: subTitle),
                Text(
                  meal.description.substring(0, 40),
                  style: subTitle,
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}
