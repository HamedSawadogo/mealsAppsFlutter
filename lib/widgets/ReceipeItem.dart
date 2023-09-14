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
            Hero(
              tag: meal.id,
              child: SizedBox(
                height:80,
                width: double.infinity,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.name,
                  style: titleBold,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meal.description.substring(1, 40),
                    style: title,
                    textAlign: TextAlign.start,
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
