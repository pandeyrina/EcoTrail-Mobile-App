import 'package:flutter/material.dart';

import '../constants.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBar,
        title:Text("Community",
            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kWhiteColor)),
      ),
    );
  }
}
