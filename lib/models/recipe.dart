import 'package:flexyy/models/flexyy_string.dart';

class Recipe {
  final String name;
  final String imageLink;
  final double calories;
  final double protein;
  final double carbohydrates;
  final double fats;
  final List<String> diets;

  Recipe({
    required this.name,
    required this.imageLink,
    required this.calories,
    required this.protein,
    required this.carbohydrates,
    required this.fats,
    required this.diets,
  });
  factory Recipe.fromJson(Map<String, Object?> json) {
    final String name = json[nameText] as String;
    final String imageLink = json[imageLinkText] as String;
    final double calories = json[caloriesText] as double;
    final double protein = json[proteinText] as double;
    final double carbohydrates = json[carbohydratesText] as double;
    final double fats = json[fatsText] as double;
    final List<String> diets = json[dietListText] as List<String>;
    return Recipe(
        name: name,
        imageLink: imageLink,
        protein: protein,
        carbohydrates: carbohydrates,
        fats: fats,
        diets: diets,
        calories: calories);
  }

  Map<String, Object> toJson() {
    return {
      nameText: name,
      imageLinkText: imageLink,
      caloriesText: calories,
      proteinText: protein,
      carbohydratesText: carbohydrates,
      fatsText: fats,
      dietListText: diets
    };
  }
}
