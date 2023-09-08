import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';
import '../widgets/ReceipeItem.dart';
//import 'package:recipes/pages/Details.dart';

class ReceipesPage extends StatefulWidget {
  const ReceipesPage({super.key});

  @override
  State<ReceipesPage> createState() => _ReceipesPageState();
}

class _ReceipesPageState extends State<ReceipesPage> {
  final TextEditingController _reciepe = TextEditingController();

  @override
  void initState() {
    super.initState();
    _reciepe.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text("favoris"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextFormField(
                      controller: _reciepe,
                      onChanged: (value) {
                        setState(() {
                          _reciepe.text = value;
                        });
                      },
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
              future: Meal.fetchData(_reciepe.text),
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
