import 'package:flutter/material.dart';
import 'package:receitas_culinarias/models/receitas.dart';

class AddRecipeScreen extends StatefulWidget {
  final Function(Recipe) onAddRecipe;

  const AddRecipeScreen({super.key, required this.onAddRecipe});

  @override
  // ignore: library_private_types_in_public_api
  _AddRecipeScreenState createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  String _imageUrl = '';
  final List<String> _ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adicionar Nova Receita')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Título'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
                onSaved: (value) {
                  _title = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Descrição'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma descrição';
                  }
                  return null;
                },
                onSaved: (value) {
                  _description = value!;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'URL da Imagem'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira a URL da imagem';
                  }
                  return null;
                },
                onSaved: (value) {
                  _imageUrl = value!;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  // Validação do formulário
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save(); // Salva os campos no estado
                    final newRecipe = Recipe(
                      title: _title,
                      description: _description,
                      imageUrl: _imageUrl,
                      ingredients: _ingredients,
                    );
                    
                    // Chama o callback para adicionar a receita
                    widget.onAddRecipe(newRecipe);

                    // Volta para a tela anterior após salvar
                    Navigator.pop(context);
                  }
                },
                child: const Text('Adicionar Receita'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
