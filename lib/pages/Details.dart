import 'package:flutter/material.dart';
import 'package:recipes/model/Ingredient.dart';
import 'package:recipes/model/IngredientList.dart';
import 'package:recipes/model/Meal.dart';

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
        backgroundColor: Colors.deepOrange,
        title: Text(widget.meal.categorie),
      ),
      body: Column(
        children: [
          Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                widget.meal.imageUrl,
                fit: BoxFit.fill,
              )),
          const SizedBox(
            height: 8,
          ),
          const Text(
            "Liste des ingredients",
            style: TextStyle(fontSize: 22),
          ),
          Expanded(
            child: FutureBuilder<List<Ingredient>>(
              future:
                  IngredientsListData.fetchMealsIngredient(widget.meal.name),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final Ingredient ingredient = snapshot.data![index];

                      return !ingredient.name.isEmpty
                          ? Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              child: Container(
                                padding: EdgeInsets.all(4),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        ingredient.name +
                                            "-------------------------------",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Expanded(child: Text(ingredient.mesure))
                                  ],
                                ),
                              ),
                            )
                          : null;
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }
                return const Center(child: CircularProgressIndicator());
              },
            ),
          ),
        ],
      ),
    );
  }
}
