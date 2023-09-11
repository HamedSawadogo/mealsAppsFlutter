import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:recipes/provider/MealsProvider.dart';
import '../model/Meal.dart';
import '../widgets/MealCardItem.dart';

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
                      const SizedBox(
                        height: 60,
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
                child: FutureBuilder(
                  future: Meal.fetchData("fish"),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          final Meal meal = snapshot.data![index];
                          return MealCardItem(meal: meal);
                        },
                      );
                    } else if (snapshot.hasError) {
                      return const Text("une erreur est survenue");
                    }
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ]),
    );
  }
}
