import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/Meal.dart';

class MoreMealInfo extends StatelessWidget {
  const MoreMealInfo({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(meal.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height * 0.3,
                width: double.infinity,
                child: Image.network(meal.imageUrl, fit: BoxFit.cover)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          meal.name,
                          textAlign: TextAlign.start,
                          style: GoogleFonts.roboto(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 30,
                          ),
                          const Icon(
                            Icons.wb_cloudy_rounded,
                            color: Colors.deepOrange,
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.share,
                                color: Colors.deepOrange,
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(meal.categorie,
                      style: GoogleFonts.roboto(fontSize: 19)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(meal.description,
                      style: GoogleFonts.aBeeZee(fontSize: 18)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
