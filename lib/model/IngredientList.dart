import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:recipes/model/Ingredient.dart';

class IngredientsListData {
  ///le nombre total d'ingrédient par plat
  static const int ingredientSize = 20;
  ///la liste des ingrédients d'une recette donné
  static List<Ingredient> ingredients = [];

  ///rechercher la liste des ingredients d'une recette donnée par son
  ///nom puis remplir la liste d'ingrédients


  static Future<List<Ingredient>> fetchMealsIngredient(final String receipe) async {
    String uri =
        "https://www.themealdb.com/api/json/v1/1/search.php?s=$receipe";
    var url = Uri.parse(uri);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['meals'];

      for (int i = 1; i <= ingredientSize; i++) {
        Ingredient ingredient = Ingredient.name();
        ///creer un nouveau objet ingrédient qui contiendra un ingrédient
        ///puis ajouter a la liste des ingrédients
        ingredient.name = jsonResponse[0]['strIngredient$i'];
        ingredient.mesure = jsonResponse[0]['strMeasure$i'];
        ingredients.add(ingredient);
      }
      return ingredients;
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
