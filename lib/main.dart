import 'package:flutter/material.dart';
import 'package:flutter/material.dart' show BuildContext, Colors, MaterialApp, State, StatefulWidget, ThemeData, VisualDensity, Widget, runApp;
import 'screens/tela_lista_receitas.dart';
import 'services/data_service.dart';
import 'models/receitas.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final DataService _dataService = DataService(); // Instância do serviço de dados
  List<Recipe> _recipes = []; // Lista de receitas carregadas

  @override
  void initState() {
    super.initState();
    _loadRecipes(); // Carregar receitas quando o app é iniciado
  }

  Future<void> _loadRecipes() async {
    List<Recipe> recipes = await _dataService.loadRecipes();
    setState(() {
      _recipes = recipes;
    });
  }

  void _addRecipe(Recipe recipe) {
    setState(() {
      _recipes.add(recipe);
    });
    _dataService.saveRecipes(_recipes); // Salvar as receitas atualizadas
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Culinary Recipes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RecipeListScreen(recipes: _recipes, onAddRecipe: _addRecipe),
    );
  }
}
