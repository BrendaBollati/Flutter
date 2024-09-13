import 'dart:convert';
import 'package:receitas_culinarias/models/receitas.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataService {
  Future<List<Recipe>> loadRecipes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? recipesString = prefs.getString('recipes');

    if (recipesString != null) {
      List<dynamic> jsonList = jsonDecode(recipesString);
      return jsonList.map((json) => Recipe.fromJson(json)).toList();
    }

    // Caso não haja receitas salvas, retornar uma lista vazia
    return [];
  }Future<void> saveRecipes(List<Recipe> recipes) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(recipes.map((r) => r.toJson()).toList());
    prefs.setString('recipes', jsonString);
  }
}

  Future<void> saveRecipes(List<Recipe> recipes) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(recipes.map((r) => r.toJson()).toList());
    prefs.setString('recipes', jsonString);
  }

