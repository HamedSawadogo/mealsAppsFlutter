import 'dart:convert';
import '../model/Meal.dart';
import 'package:http/http.dart' as http;

class MealController {
  static Future<List<Meal>> fetchData(String receipe) async {
    String uri =
        "https://www.themealdb.com/api/json/v1/1/search.php?s=${receipe}";
    var url = Uri.parse(uri);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body)['meals'];
      return jsonResponse.map((e) => Meal.fromJson(e)).toList();
    } else {
      throw Exception('Unexpected error occured!');
    }
  }
}
