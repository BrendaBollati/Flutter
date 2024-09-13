import 'package:flutter/material.dart';
import '../models/receitas.dart';
import 'add_receitas_tela.dart';
import '../widgets/cartao_receitas.dart';

class RecipeListScreen extends StatelessWidget {
  final List<Recipe> recipes;
  final Function(Recipe) onAddRecipe;

  const RecipeListScreen({super.key, required this.recipes, required this.onAddRecipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Receitas')),
      body: recipes.isEmpty
          ? const Center(child: Text('Nenhuma receita adicionada.'))
          : ListView.builder(
              itemCount: recipes.length,
              itemBuilder: (context, index) {
                var recipeCard = RecipeCard(recipe: recipes[index]);
                return recipeCard;
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar para a tela de adicionar uma nova receita
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRecipeScreen(onAddRecipe: onAddRecipe),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
