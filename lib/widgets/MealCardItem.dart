import 'package:flutter/material.dart';
import 'package:recipes/utils/constants.dart';
import '../model/Meal.dart';

class MealCardItem extends StatelessWidget {
  const MealCardItem({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                )),
            Row(
              children: [
                Expanded(
                  child: Text(
                    meal.name,
                    style: titleBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      for (int i = 0; i < 5; i++)
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                    ],
                  ),
                )
              ],
            ),
            Text(
              meal.categorie,
              style: titleBold,
            ),
            Text(
              meal.description.substring(0, 200),
              style: subTitle,
            ),
          ],
        ),
      ),
    );
  }
}
