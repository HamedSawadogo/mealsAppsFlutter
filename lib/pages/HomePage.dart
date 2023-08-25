import 'package:flutter/material.dart';
import 'package:recipes/main.dart';
import '../pages/Recettes.dart';
import '../pages/FavoritePage.dart';
import '../pages/Recettes.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key, required this.username});
  final String username;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: [
          Text('Welcomme ${widget.username}!'),
          Text("Favories")
        ][_pageIndex],
      ),
      body: [const ReceipesPage(), const FavoritePage()][_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 19,
        currentIndex: _pageIndex,
        onTap: (value) {
          setState(() {
            _pageIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              tooltip: "recettes",
              icon: Icon(
                Icons.food_bank,
                color: Colors.pink,
              ),
              label: "recettes"),
          BottomNavigationBarItem(
              backgroundColor: Colors.pink,
              icon: Icon(
                Icons.favorite,
                color: Colors.pink,
              ),
              label: "favorits"),
        ],
      ),
    );
  }
}
