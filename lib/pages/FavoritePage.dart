import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';
import '../widgets/FavoriteMealItem.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: const Text('favorites'),
        ),
        body: FutureBuilder<List<Meal>>(
          future: Meal.fetchData(""),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final Meal meal = snapshot.data![index];
                  return FavoriteMealItem(meal: meal);
                },
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator());
          },
        ));
  }
}
