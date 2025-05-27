// models/category.dart
class Category {
  final String id;
  final String name;
  final String iconPath;

  Category({
    required this.id,
    required this.name,
    required this.iconPath,
  });
}

// models/challenge.dart
class Challenge {
  final String id;
  final String title;
  final String description;
  final String categoryId;
  final String imagePath;
  final String emissionsReduction;

  Challenge({
    required this.id,
    required this.title,
    required this.description,
    required this.categoryId,
    required this.imagePath,
    required this.emissionsReduction,
  });
}