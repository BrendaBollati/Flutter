class Recipe {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> ingredients;

  Recipe({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.ingredients,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) {
    return Recipe(
      title: json['title'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      ingredients: List<String>.from(json['ingredients']),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      'ingredients': ingredients,
    };
  }
}
