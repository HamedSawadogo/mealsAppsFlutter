import 'package:flutter/material.dart';
import 'package:recipes/model/Meal.dart';
import 'package:recipes/utils/constants.dart';
import '../widgets/ReceipeItem.dart';

class ReceipesPage extends StatefulWidget {
  const ReceipesPage({super.key});

  @override
  State<ReceipesPage> createState() => _ReceipesPageState();
}

class _ReceipesPageState extends State<ReceipesPage> {
  final TextEditingController _reciepe = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _reciepe.dispose();
  }

  @override
  void initState() {
    super.initState();
    _reciepe.text = "fish";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: const [
            ListTile(
              title: Text("favoris"),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: TextField(
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
                              color: appColor,
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
                  return const Text('aucune reccete trouvé!');
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
