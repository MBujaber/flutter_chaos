import 'dart:convert';

class Recipe {
  int id;
  String title;
  String image;
  List<int> ingredient;
  // String user;
  int category;
  Recipe({
    required this.id,
    required this.title,
    required this.image,
    required this.ingredient,
    required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'ingredient': ingredient,
      'category': category,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id']?.toInt() ?? 0,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      ingredient: List<int>.from(map['ingredient']),
      category: map['category']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));
}
