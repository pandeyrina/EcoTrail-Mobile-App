// repositories/data_repository.dart
import '../models/category_model.dart';

class DataRepository {
  static final List<Category> categories = [
    Category(id: 'all', name: 'All', iconPath: 'assets/all.png'),
    Category(id: 'popular', name: 'Popular', iconPath: 'assets/popular.png'),
    Category(id: 'energy', name: 'Energy', iconPath: 'assets/energy.png'),
    Category(id: 'ecohabits', name: 'Ecohabits', iconPath: 'assets/ecohabits.png'),
    Category(id: 'waste', name: 'Waste', iconPath: 'assets/waste.png'),
    Category(id: 'water', name: 'Water', iconPath: 'assets/water.png'),
    Category(id: 'transportation', name: 'Transportation', iconPath: 'assets/transportation.png'),
    Category(id: 'food', name: 'Food', iconPath: 'assets/food.png'),
    Category(id: 'shopping', name: 'Shopping', iconPath: 'assets/shopping.png'),
  ];

  static final List<Challenge> challenges = [
    Challenge(
      id: '1',
      title: 'Water saving quick wins',
      description: 'Simple changes to reduce water usage',
      categoryId: 'water',
      imagePath: 'assets/water.png',
      emissionsReduction: 'Reduce emissions by 430 kg',
    ),
    // Add more challenges for each category
    // ...
  ];

  static List<Challenge> getChallengesByCategory(String categoryId) {
    if (categoryId == 'all') return challenges;
    if (categoryId == 'popular') {
      // Return some popular challenges logic
      return challenges.where((c) => ['1', '2', '3'].contains(c.id)).toList();
    }
    return challenges.where((c) => c.categoryId == categoryId).toList();
  }
}