import 'package:flutter/widgets.dart';
import 'package:recipes/model/Meal.dart';

class MealFavoriotesProdider with ChangeNotifier {
  List<Meal> favorites = [];

  bool isFavoriteMeal(Meal _meal) {
    for (Meal meal in favorites) {
      if (meal.id == _meal.id || meal.name == _meal.name || meal == _meal) {
        return true;
      }
    }
    return false;
  }

  void addFavorite(Meal meal) {
    meal.isFavorite = !meal.isFavorite;
    if (meal.isFavorite && !isFavoriteMeal(meal)) {
      favorites.add(meal);
    } else {
      favorites.remove(meal);
    }
    notifyListeners();
  }

  List<Meal> favoritesMeals() {
    return favorites;
  }
}
