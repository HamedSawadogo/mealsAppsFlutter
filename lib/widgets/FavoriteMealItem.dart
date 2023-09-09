import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
            child: SizedBox(
                height: 80,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.fill,
                ))),
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
                  style: GoogleFonts.roboto(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Text(meal.categorie, style: GoogleFonts.roboto(fontSize: 15)),
                Text(meal.description.substring(0, 40),
                    style: GoogleFonts.roboto(fontSize: 15))
              ],
            ),
          ),
        )
      ]),
    );
  }
}
