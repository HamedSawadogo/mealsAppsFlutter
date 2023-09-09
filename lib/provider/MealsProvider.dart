import 'package:flutter/widgets.dart';
import 'package:recipes/model/Meal.dart';

class MealFavoriotesProdider with ChangeNotifier {
  List<Meal> favorites = [];

  bool isFavoriteMeal(Meal _meal) {
    for (Meal meal in favorites) {
      if (meal.id == _meal.id || meal.name == _meal.name) {
        return meal.isFavorite;
      }
    }
    return false;
  }

  void addFavorite(Meal meal) {
    if (meal.isFavorite) {
      meal.isFavorite = !meal.isFavorite;
      notifyListeners();
    } else {
      favorites.add(meal);
      notifyListeners();
    }
  }

  List<Meal> favoritesMeals() {
    return favorites;
  }
}
