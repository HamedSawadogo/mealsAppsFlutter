import 'dart:convert';
import 'package:http/http.dart' as http;

class Ingredient {
  String name;
  String mesure;

  Ingredient({
    required this.name,
    required this.mesure,
  });
}
