import 'package:ecotrail/screens/ChallengesDetail.dart';
import 'package:ecotrail/screens/tabs/categories.dart';
import 'package:ecotrail/widgets/custom_heading.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../repository/DataRepository.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  State<ChallengesScreen> createState() => _ChallengesScreenState();
}

enum ChallengeTab { inProgress, completed, all }

class _ChallengesScreenState extends State<ChallengesScreen> {
  ChallengeTab _selectedTab = ChallengeTab.inProgress;

  @override
  Widget build(BuildContext context) {
    final challenges = _getChallengesForTab(_selectedTab);

    return Scaffold(
      backgroundColor: const Color(0xFFE0E0E0),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8EE3E1),
        elevation: 0,
        title: CustomHeading(title: "Challenges"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: IconButton(icon:const Icon(Icons.menu), color: Colors.white, onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(
                    categories: DataRepository.categories,
                    selectedCategoryId: 'all', // Default to 'All'
                  ),
                ),
              );
            },),
          ),
        ],
        leading: const Icon(Icons.search, color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Filter Tabs
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                _buildTab("IN PROGRESS", ChallengeTab.inProgress),
                const SizedBox(width: 10),
                _buildTab("COMPLETED", ChallengeTab.completed),
                const SizedBox(width: 10),
                _buildTab("ALL", ChallengeTab.all),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              _selectedTab == ChallengeTab.inProgress
                  ? "My Active Habits"
                  : _selectedTab == ChallengeTab.completed
                  ? "Completed Tasks"
                  : "All Tasks",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.only(bottom: 16),
              children: [
                if (_selectedTab == ChallengeTab.inProgress ||
                    _selectedTab == ChallengeTab.all) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "In Progress",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ..._getChallengesForTab(ChallengeTab.inProgress).map(
                    (habit) => _buildHabitCard(
                      title: habit["title"],
                      progress: habit["progress"],
                      icon: habit["icon"],
                      color: habit["color"],
                      isCompleted: false,
                    ),
                  ),
                ],
                if (_selectedTab == ChallengeTab.completed ||
                    _selectedTab == ChallengeTab.all) ...[
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Text(
                      "Completed",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  ..._getChallengesForTab(ChallengeTab.completed).map(
                    (habit) => _buildHabitCard(
                      title: habit["title"],
                      progress: habit["progress"],
                      icon: habit["icon"],
                      color: habit["color"],
                      isCompleted: true,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String label, ChallengeTab tab) {
    final isActive = _selectedTab == tab;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = tab;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF3AA8A4) : Color(0xffD2D2D2),
          borderRadius: BorderRadius.circular(20),
          boxShadow:
              isActive
                  ? []
                  : [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      offset: const Offset(2, 2),
                      blurRadius: 4,
                    ),
                  ],
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildHabitCard({
    required String title,
    required String progress,
    required IconData icon,
    required Color color,
    required bool isCompleted,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: isCompleted ? Color(0xffFEA074) : Color(0xff5299C5),
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 40),
                Image.asset("assets/bicycle.png"),
              ],
            ),
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(progress, style: TextStyle(color: Colors.white)),
                SizedBox(height: 40),
                if (!isCompleted)
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEDB552),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChallengesDetail(),
                        ),
                      );
                    },
                    child: const Text(
                      "+ LOG",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

List<Map<String, dynamic>> _getChallengesForTab(ChallengeTab tab) {
  switch (tab) {
    case ChallengeTab.inProgress:
      return [
        {
          "title": "Keep cup and carry on",
          "progress": "1/2 rides completed",
          "icon": Icons.local_cafe,
          "color": Colors.blue,
        },
        {
          "title": "Drive less, bike more",
          "progress": "1/2 rides completed",
          "icon": Icons.directions_bike,
          "color": Colors.blue,
        },
      ];
    case ChallengeTab.completed:
      return [
        {
          "title": "Recycle Plastic Weekly",
          "progress": "2/2 completed",
          "icon": Icons.recycling,
          "color": Colors.green,
        },
        {
          "title": "Use Public Transport",
          "progress": "4/4 completed",
          "icon": Icons.directions_bus,
          "color": Colors.teal,
        },
      ];
    case ChallengeTab.all:
      return _getChallengesForTab(ChallengeTab.inProgress) +
          _getChallengesForTab(ChallengeTab.completed);
  }
}
