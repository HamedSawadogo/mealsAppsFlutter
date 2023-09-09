import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/MealsProvider.dart';
import '../model/Meal.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    MealFavoriotesProdider provider =
        Provider.of<MealFavoriotesProdider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Recettes du jour"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: provider.favoritesMeals().length,
            itemBuilder: (context, index) {
              final Meal meal = provider.favoritesMeals()[index];
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: 110,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          meal.imageUrl,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Positioned(
                        bottom: 10,
                        left: 40,
                        child: Center(
                          child: Text(
                            meal.name,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "RECETTES POPULAIRES",
                style: GoogleFonts.roboto(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.favoritesMeals().length,
                  itemBuilder: (context, index) {
                    final Meal meal = provider.favoritesMeals()[index];
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
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
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
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              meal.description.substring(0, 200),
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
