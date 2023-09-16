import 'dart:convert';

class Meal {
  String imageUrl;
  String description;
  String categorie;
  String id;
  String name;
  bool isFavorite = false;
  String youtubeUrl;
  String websiteLink;
  static List<Meal> favorites = [];

  Meal(
      {required this.imageUrl,
      required this.description,
      required this.categorie,
      required this.id,
      required this.name,
      required this.youtubeUrl,
      required this.websiteLink});

  //favorites Meals

  static List<Meal> favoritesMeals() {
    return favorites;
  }

  static getMeal(int index) {
    return favorites[index];
  }

  static bool inFavorite(Meal _meal) {
    for (Meal meal in favorites) {
      if (meal.categorie == _meal.categorie) {
        return true;
      }
    }
    return false;
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
        imageUrl: map['strMealThumb'] ?? '',
        description: map['strInstructions'] ?? '',
        categorie: map['strTags'] ?? '',
        id: map['idMeal'] ?? '',
        name: map["strMeal"],
        youtubeUrl: map['strYoutube'],
        websiteLink: map['strSource']);
  }
  String toJson() => json.encode(toMap());
}
