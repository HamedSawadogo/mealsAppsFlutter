import "package:flutter/material.dart";
import "package:recipes/utils/constants.dart";
import "../model/Meal.dart";
import "../pages/Details.dart";

class ReceipeItem extends StatelessWidget {
  const ReceipeItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => DetailsPage(meal: meal)));
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: meal.id,
                child: SizedBox(
                  height: 300,
                  width: double.infinity,
                  child: Image.network(
                    meal.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  meal.name,
                  style: titleBold,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meal.description.substring(1, 40),
                    style: title,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
