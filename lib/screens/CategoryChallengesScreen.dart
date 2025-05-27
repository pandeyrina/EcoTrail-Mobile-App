// screens/category_challenges_screen.dart

import 'package:ecotrail/screens/ChallengesDetail.dart';
import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../repository/DataRepository.dart';

class CategoryChallengesScreen extends StatefulWidget {
  final List<Category> categories;
  final Category selectedCategory;

  const CategoryChallengesScreen({
    super.key,
    required this.categories,
    required this.selectedCategory,
  });

  @override
  State<CategoryChallengesScreen> createState() => _CategoryChallengesScreenState();
}

class _CategoryChallengesScreenState extends State<CategoryChallengesScreen> {
  late Category _selectedCategory;

  @override
  void initState() {
    super.initState();
    _selectedCategory = widget.selectedCategory;
  }

  @override
  Widget build(BuildContext context) {
    final challenges = DataRepository.getChallengesByCategory(_selectedCategory.id);

    return Scaffold(
      appBar: AppBar(
        title: Text(_selectedCategory.name),
      ),
      body: Column(
        children: [
          // Horizontal categories list
          SizedBox(
            height: 60,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.categories.length,
              itemBuilder: (context, index) {
                final category = widget.categories[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ChoiceChip(
                    label: category.name,
                    selected: _selectedCategory.id == category.id,
                    onSelected: (selected) {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                  ),
                );
              },
            ),
          ),

          // Vertical challenges list
          Expanded(
            child: ListView.builder(
              itemCount: challenges.length,
              itemBuilder: (context, index) {
                final challenge = challenges[index];
                return ChallengeCard(challenge: challenge);
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Custom ChoiceChip widget
class ChoiceChip extends StatelessWidget {
  final String label;
  final bool selected;
  final ValueChanged<bool> onSelected;

  const ChoiceChip({
    super.key,
    required this.label,
    required this.selected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(!selected),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

// Challenge Card Widget
class ChallengeCard extends StatelessWidget {
  final Challenge challenge;

  const ChallengeCard({super.key, required this.challenge});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ChallengesDetail()));
      },
      child: Card(
        margin: const EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: const Color(0xff8DF7F7),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.grey.shade300)],
              ),
              height: 150,
              child: Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(challenge.imagePath, height: 50, alignment: Alignment.centerRight),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    challenge.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(Icons.arrow_drop_down_outlined, size: 30, color: Color(0xff91CDCD)),
                      Text(
                        challenge.emissionsReduction,
                        style: TextStyle(color: Colors.grey[600]),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}