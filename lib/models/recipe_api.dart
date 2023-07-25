import 'package:flexyy/models/flexyy_errors.dart';
import 'package:flexyy/models/flexyy_string.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show jsonDecode;

class RecipeApi {
  const RecipeApi._sharedInstance();
  static const _shared = RecipeApi._sharedInstance();
  factory RecipeApi() {
    return _shared;
  }
  // get a list of map from the recipes database using the api to create recipes out of these Maps
  Future<List<Map<String, Object?>>> getRecipes(String? diet, String recipe,
      double? minCalories, double? maxCalories) async {
    String endPoint;
    // if the user dont specify a diet type and the calories , we get a random diet
    if (diet == null && minCalories == null && maxCalories == null) {
      endPoint =
          "$recipeApiText?type=public&q=${recipe.trim()}&app_id=331c60ea&app_key=%20918f818e6f75133858c5162fb88230dd";
    }
    //else  if the user specified a diet and didnt specify calories  we give him recipes of that diet
    else if (diet != null && minCalories == null && maxCalories == null) {
      endPoint =
          "$recipeApiText?type=public&q=${recipe.trim()}&app_id=331c60ea&app_key=%20918f818e6f75133858c5162fb88230dd&diet=$diet";
    }
    // else if the user specified calories but didnt specify diets we give him recipes which are in the range of calories
    else if (diet == null && minCalories != null && maxCalories != null) {
      endPoint =
          "$recipeApiText?type=public&q=${recipe.trim()}&app_id=331c60ea&app_key=%20918f818e6f75133858c5162fb88230dd&calories=calories%3D$minCalories-$maxCalories";
    }
    // else if the user specified everything , we are going to give him a specific recipes
    else if (diet != null && minCalories != null && maxCalories != null) {
      endPoint =
          "$recipeApiText?type=public&q=${recipe.trim()}&app_id=331c60ea&app_key=%20918f818e6f75133858c5162fb88230dd&diet=$diet&calories=calories%3D$minCalories-$maxCalories";
    }
    // this last else statement is just to not get error because it will never happen
    else {
      endPoint =
          "$recipeApiText?type=public&q=${recipe.trim()}&app_id=331c60ea&app_key=%20918f818e6f75133858c5162fb88230dd";
    }

    final url = Uri.parse(endPoint);
    final response = await http.get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      final json = decodeRecipeResponse(response.body);
      return json;
    } else {
      final String errorCode = response.statusCode.toString();
      final FlexyyError error = FlexyyError.fromRawError(errorCode);
      throw (error);
    }
  }

  // a function to return a specific List of Maps for a Recipe Object from a json
  List<Map<String, Object?>> decodeRecipeResponse(String json) {
    List<Map<String, Object?>> answerList = [];
    Map<String, Object?> data = jsonDecode(json);
    final List foodList = data["hits"] as List;
    for (final food in foodList) {
      final String name = food["label"] as String;
      final String imageLink = food["image"] as String;
      final List<String> dietList = food["dietLabels"] as List<String>;
      final double calories = food["calories"] as double;
      // to get the macroNutritients which are in nested Maps i needed to get the Maps one by one
      final Map<String, Object?> macroNutrientsMap =
          food["totalNutrients"] as Map<String, Object?>;
      final Map<String, Object?> fatsMap =
          macroNutrientsMap["FAT"] as Map<String, Object?>;
      final Map<String, Object?> carbsMap =
          macroNutrientsMap["CHOCDF"] as Map<String, Object?>;
      final Map<String, Object?> proteinMap =
          macroNutrientsMap["PROCNT"] as Map<String, Object?>;

      final double fats = fatsMap["quantity"] as double;
      final double carbs = carbsMap["quantity"] as double;
      final double protein = proteinMap["quantity"] as double;

      final Map<String, Object?> answer = {
        nameText: name,
        imageLinkText: imageLink,
        dietListText: dietList,
        caloriesText: calories,
        proteinText: protein,
        fatsText: fats,
        carbohydratesText: carbs
      };
      answerList.add(answer);
    }
    return answerList;
  }
}
