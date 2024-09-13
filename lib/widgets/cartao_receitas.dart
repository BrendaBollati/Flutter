import 'package:flutter/material.dart';
import 'package:receitas_culinarias/models/receitas.dart';

class RecipeCard extends StatelessWidget {
  final Recipe recipe;

  const RecipeCard({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(recipe.imageUrl), // Exibe imagem da URL
          Text(recipe.title, style: const TextStyle(fontSize: 20)),
        ],
      ),
    );
  }
}
