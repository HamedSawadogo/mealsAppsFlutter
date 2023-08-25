import 'dart:convert';

import 'package:http/http.dart' as http;

class Meal {
  String imageUrl;
  String description;
  String categorie;
  String id;
  bool isFavorite = false;
  static List<Meal> favorites = [];
  Meal({
    required this.imageUrl,
    required this.description,
    required this.categorie,
    required this.id,
  });

  static Future<List<Meal>> fetchData() async {
    String uri = "https://www.themealdb.com/api/json/v1/1/categories.php";
    var url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['categories'];
      return jsonResponse.map((e) => Meal.fromJson(e)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
  //favorites Meals

  static List<Meal> favoritesMeals() {
    return favorites;
  }

  static getMeal(int index) {
    return favorites[index];
  }

  static void addFavoriteMeal(Meal meal) {
    if (meal.isFavorite) {
      favorites.add(meal);
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': imageUrl,
      'description': description,
      'categorie': categorie,
      'id': id,
    };
  }

  factory Meal.fromJson(Map<String, dynamic> map) {
    return Meal(
      imageUrl: map['strCategoryThumb'] ?? '',
      description: map['strCategoryDescription'] ?? '',
      categorie: map['strCategory'] ?? '',
      id: map['idCategorie'] ?? '',
    );
  }
  String toJson() => json.encode(toMap());
}
