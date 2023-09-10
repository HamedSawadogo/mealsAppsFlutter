import 'package:flutter/material.dart';
import 'package:recipes/pages/WelcomePage.dart';
import '../pages/Recettes.dart';
import '../pages/FavoritePage.dart';
import 'package:dot_navigation_bar/dot_navigation_bar.dart';

enum _SelectedTab { home, fastfood, favorite }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const WelcomePage(),
        const ReceipesPage(),
        const FavoritePage()
      ][_SelectedTab.values.indexOf(_selectedTab)],
      bottomNavigationBar: DotNavigationBar(
        backgroundColor:const Color.fromARGB(248, 236, 234, 234),
        currentIndex: _SelectedTab.values.indexOf(_selectedTab),

        onTap: _handleIndexChanged,
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: const Icon(Icons.home),
            selectedColor: Colors.purple,
          ),

          /// Likes
          DotNavigationBarItem(
            icon: const Icon(Icons.fastfood),
            selectedColor: Colors.orange,
          ),
          DotNavigationBarItem(
            icon: Icon(Icons.favorite),
            selectedColor: Colors.pink,
          ),
        ],
      ),
    );
  }
}
