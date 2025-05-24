import 'package:ecotrail/screens/challenges_screen.dart';
import 'package:ecotrail/screens/community_screen.dart';
import 'package:ecotrail/screens/home_tab_screen.dart';
import 'package:ecotrail/screens/profile_screen.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/custom_heading.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectedIndex,
        children: [
          HomeTabScreen(),
          ChallengesScreen(),
          CommunityScreen(),
          ProfileScreen()
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        // selectedItemColor:Color(0xff78D4D4) ,
        // unselectedItemColor: Color(0xffD2D2D2),
        selectedLabelStyle: TextStyle(color:Color(0xff78D4D4),    fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(color:Color(0xffD2D2D2) ),
        showUnselectedLabels: true,
        onTap: (index){
          setState(() {
            selectedIndex=index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon:ColorFiltered(colorFilter: ColorFilter.mode(selectedIndex==0?Color(0xff78D4D4):Color(0xffD2D2D2), BlendMode.srcIn),
            child: Image.asset("assets/hometab.png")),
            label: "Home"
          ),
          BottomNavigationBarItem(
            icon: ColorFiltered(colorFilter: ColorFilter.mode(selectedIndex==1?Color(0xff78D4D4):Color(0xffD2D2D2), BlendMode.srcIn),
            child: Image.asset("assets/challenges.png")),
            label: 'Challenges',
          ),
           BottomNavigationBarItem(
            icon: ColorFiltered(colorFilter: ColorFilter.mode(selectedIndex==2?Color(0xff78D4D4):Color(0xffD2D2D2), BlendMode.srcIn),
            child: Image.asset("assets/community.png")),
            label: 'Community',
          ),
           BottomNavigationBarItem(
            icon: ColorFiltered(
                
                colorFilter:  ColorFilter.mode(selectedIndex==3?Color(0xff78D4D4):Color(0xffD2D2D2), BlendMode.srcIn),
                child: Image.asset("assets/profile.png")),
            label: 'Profile',
          ),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




