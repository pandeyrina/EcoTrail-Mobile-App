import 'package:flutter/material.dart';

import '../constants.dart';
class CustomHeading extends StatefulWidget {
  final String title;
    CustomHeading({super.key, required this.title});

  @override
  State<CustomHeading> createState() => _CustomHeadingState();
}

class _CustomHeadingState extends State<CustomHeading> {
  @override
  Widget build(BuildContext context) {
    return Text(widget.title??"",
      style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: kWhiteColor),);
  }
}

class CustomText extends StatelessWidget {
  final String text;
  final int fontSize=12;

  final bool isLarge;

  const CustomText({super.key, required this.text,this.isLarge=true});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,style: TextStyle(fontSize: isLarge?20:12),
    );
  }
}
