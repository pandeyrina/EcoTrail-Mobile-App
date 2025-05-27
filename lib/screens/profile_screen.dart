import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(MaterialApp(home: ProfileScreen()));
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        body: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 50, bottom: 20),
              color: Colors.teal[200],
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.topRight,
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage('assets/rina.jpg'), // Replace with your image
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.settings, color: Colors.white),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Rina Pandey',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  TabBar(
                    labelColor: Colors.blueAccent,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: Colors.blueAccent,
                    tabs: const [
                      Tab(text: 'STATS'),
                      Tab(text: 'ACHIEVEMENTS'),
                      Tab(text: 'ACTIVITY'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  StatsTab(),
                  AchievementsTab(),
                  ActivityTab(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text("My Footprint", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(height: 10),
    PieChart(
    dataMap: {
    "CO2": 148,
    "Waste Diverted": 26,
    "Water Savings": 16,
    },
    animationDuration: Duration(milliseconds: 800),
    chartLegendSpacing: 32,
    chartRadius: MediaQuery.of(context).size.width / 2.2,
    colorList: [
    Colors.teal[700]!,
    Colors.teal[300]!,
    Colors.amber[700]!,
    ],
    initialAngleInDegree: 0,
    chartType: ChartType.ring,
    ringStrokeWidth: 28,
    centerText: "148kg\nCO2",
    legendOptions: LegendOptions(
    showLegends: false,
    ),
    chartValuesOptions: ChartValuesOptions(
    showChartValues: false,
    ),),

        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImpactCard(label: "KILOGRAMS\nCO2 SAVINGS", value: "20", color: Colors.teal),
              ImpactCard(label: "KILOGRAMS\nWaste Diverted", value: "26", color: Colors.green),
              ImpactCard(label: "LITRES\nWater Savings", value: "16", color: Colors.amber),
            ],
          ),
        ),
      ],
    );
  }
}
class AchievementsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // Level Progress Card
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade300, blurRadius: 8, offset: Offset(0, 4)),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: const [
                    CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.black,
                      child: Text("2", style: TextStyle(color: Colors.white)),
                    ),
                    SizedBox(width: 10),
                    Text("Level 2", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                const SizedBox(height: 8),
                const Text("500 points to the next level", style: TextStyle(color: Colors.grey)),
                const SizedBox(height: 12),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    Container(
                      height: 22,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        gradient: const LinearGradient(
                          colors: [Color(0xFFFFC107), Color(0xFFFFD54F)],
                        ),
                      ),
                      width: double.infinity,
                    ),
                    Container(
                      height: 22,
                      width: (5200 / 6000) * MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.orangeAccent,
                      ),
                      alignment: Alignment.center,
                      child: const Text(
                        "5200/6000",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Positioned(
                      left: 6,
                      child: const Text("2", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Positioned(
                      right: 6,
                      child: const Text("3", style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 30),

          // Badge Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              BadgeCard(title: "Gold", value: "24", color: Color(0xFFFFD700)),
              BadgeCard(title: "Silver", value: "18", color: Colors.grey),
              BadgeCard(title: "Bronze", value: "18", color: Color(0xFFCD7F32)),
            ],
          ),
        ],
      ),
    );
  }
}

class BadgeCard extends StatelessWidget {
  final String title;
  final String value;
  final Color color;

  const BadgeCard({
    required this.title,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 8)],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 12,
            backgroundColor: color,
          ),
          const SizedBox(height: 6),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(value, style: TextStyle(color: Colors.grey[600])),
        ],
      ),
    );
  }
}


class ActivityTab extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/grid1.jpeg',
    'assets/grid2.jpeg',
    'assets/grid3.jpg',
    'assets/grid1.jpeg',
    'assets/grid2.jpeg',
    'assets/grid3.jpg',
    'assets/grid3.jpg',
    'assets/grid3.jpg',
    'assets/grid1.jpeg',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: GridView.builder(
        itemCount: imagePaths.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
        ),
        itemBuilder: (context, index) {
          return Image.asset(
            imagePaths[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }
}


class ImpactCard extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const ImpactCard({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: color,
          radius: 40,
          child: Text(value, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        const SizedBox(height: 6),
        Text(
          label,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),
        ),
      ],
    );
  }
}
