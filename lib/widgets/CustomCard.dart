import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final Color cardColor;
  final double cardHeight;
  const CustomCard({super.key, required this.cardColor, required this.cardHeight});

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cardColor,

    );
  }
}
