import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/model/mealsData.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key, required this.meal});
  final Meal meal;

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(widget.meal.categorie),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              width: double.infinity,
              child: Image.network(widget.meal.imageUrl),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.meal.categorie,
                                style: GoogleFonts.aBeeZee(
                                    fontSize: 22, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Icon(
                                Icons.share,
                                size: 29,
                                color: Colors.pink,
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              InkWell(
                                onTap: () {
                                  widget.meal.isFavorite =
                                      !widget.meal.isFavorite;
                                  Meal.addFavoriteMeal(widget.meal);
                                },
                                child: Icon(
                                  widget.meal.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 29,
                                  color: Colors.pink,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(widget.meal.description,
                      style: GoogleFonts.sahitya(fontSize: 19))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
