import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/pages/Details.dart';
//import 'package:recipes/pages/Details.dart';

class ReceipesPage extends StatelessWidget {
  const ReceipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "rechercher une recette",
                          suffixIcon: IconButton(
                              onPressed: () {},
                              color: Colors.deepOrange,
                              icon: const Icon(Icons.search)),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)))),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Meal>>(
              future: Meal.fetchData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 3,
                    crossAxisSpacing: 3,
                    children: [
                      for (final meal in snapshot.data!) ReceipeItem(meal: meal)
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                // By default, show a loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
        elevation: 4,
        child: Column(
          children: [
            Expanded(
              child: SizedBox(
                height: 200,
                child: Image.network(
                  meal.imageUrl,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  meal.categorie,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    meal.description.substring(1, 40),
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
