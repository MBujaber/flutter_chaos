import 'dart:convert';

class Recipe {
  int? id;
  String title;
  String image;
  // String ingredient;
  // String user;
  // String category;

  Recipe({
    this.id,
    required this.title,
    required this.image,
    // required this.ingredient,
    // required this.user,
    // required this.category,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'image': image,
      // 'ingredient': ingredient,
      // 'user': user,
      // 'category': category,
    };
  }

  factory Recipe.fromMap(Map<String, dynamic> map) {
    return Recipe(
      id: map['id']?.toInt(),
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      // ingredient: map['ingredient'] ?? '',
      // user: map['user'] ?? '',
      // category: map['category'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Recipe.fromJson(String source) => Recipe.fromMap(json.decode(source));
}
