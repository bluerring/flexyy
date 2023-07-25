import 'package:flexyy/models/flexyy_string.dart';
import 'package:flexyy/models/recipe.dart';

class Meal {
  final String name;
  final String description;

  final List<Recipe> recipes;
  final double protein;
  final double carbohydrates;
  final double fats;
  final double calories;
  Meal(
      {required this.name,
      required this.description,
      required this.recipes,
      required this.protein,
      required this.carbohydrates,
      required this.fats,
      required this.calories});
  toJson() {
    final List<Map<String, Object>> recipesToJson = [];
    for (final recipe in recipes) {
      final Map<String, Object> recipeToJson = recipe.toJson();
      recipesToJson.add(recipeToJson);
    }
    return {
      nameText: name,
      descriptionText: description,
      recipesText: recipesToJson,
      proteinText: protein,
      carbohydratesText: carbohydrates,
      fatsText: fats,
      caloriesText: calories
    };
  }

  factory Meal.fromJson(Map<String, Object> json) {
    final String name = json[nameText] as String;
    final String description = json[descriptionText] as String;

    final List<Recipe> recipes = [];
    for (final recipeJson in json[recipesText] as List<Map<String, Object>>) {
      final Recipe recipe = Recipe.fromJson(recipeJson);
      recipes.add(recipe);
    }
    final double protein = json[proteinText] as double;
    final double carbohydrates = json[carbohydratesText] as double;
    final double fats = json[fatsText] as double;
    final double calories = json[caloriesText] as double;

    return Meal(
        name: name,
        description: description,
        recipes: recipes,
        protein: protein,
        carbohydrates: carbohydrates,
        fats: fats,
        calories: calories);
  }
}
