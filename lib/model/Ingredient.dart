///
/// class with represent ingredient name
class Ingredient {
  /// name of ingredient
  String name;

  /// measure of ingredient for example (1/4 oil)
  String mesure;

  ///default constructor
  Ingredient.name():
    name="",
    mesure="";

  Ingredient({
    required this.name,
    required this.mesure,
  });

}
