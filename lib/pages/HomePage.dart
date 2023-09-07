import 'package:flutter/material.dart';
import '../pages/Recettes.dart';
import '../pages/FavoritePage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      drawer: Drawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: [const ReceipesPage(), const FavoritePage()][_pageIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   elevation: 19,
      //   currentIndex: _pageIndex,
      //   onTap: (value) {
      //     setState(() {
      //       _pageIndex = value;
      //     });
      //   },
      //   items: const [
      //     BottomNavigationBarItem(
      //         backgroundColor: Colors.green,
      //         tooltip: "recettes",
      //         icon: Icon(
      //           Icons.food_bank,
      //           color: Colors.green,
      //         ),
      //         label: "recettes"),
      //     BottomNavigationBarItem(
      //         backgroundColor: Colors.green,
      //         icon: Icon(
      //           Icons.favorite,
      //           color: Colors.green,
      //         ),
      //         label: "favorits"),
      //   ],
      // ),
    );
  }
}
