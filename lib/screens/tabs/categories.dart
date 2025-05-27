// screens/categories_screen.dart
import 'package:ecotrail/widgets/custom_heading.dart';
import 'package:flutter/material.dart';

import '../../models/category_model.dart';
import '../CategoryChallengesScreen.dart';

class CategoriesScreen extends StatelessWidget {
  final List<Category> categories;
  final String selectedCategoryId;

  const CategoriesScreen({
    super.key,
    required this.categories,
    required this.selectedCategoryId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff60CCCC),
      appBar: AppBar(
        leading: Center(),
        backgroundColor: Color(0xff60CCCC) ,
        actions: [
          IconButton(onPressed: (){
            Navigator.pop(context);
          }, icon: Icon(Icons.close,color: Colors.white,))
        ],
        title:  CustomHeading( title: 'Categories',),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return ListTile(
            // leading: Image.asset(category.iconPath, width: 24, height: 24),
            title: Text(category.name,style: TextStyle(color: Colors.white),),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryChallengesScreen(
                    categories: categories,
                    selectedCategory: category,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}