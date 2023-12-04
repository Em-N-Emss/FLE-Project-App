import 'package:flutter/material.dart';

class PlayerHealthBar extends StatelessWidget {
  final double health;
  final double barHeight;

  const PlayerHealthBar({
    Key? key,
    required this.health,
    this.barHeight = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final barWidth = screenWidth * 0.8; // Adjust the width as needed

    final int numHearts = (health / 25).ceil(); // Calculate the number of hearts based on the health

    return Container(
      height: barHeight,
      width: barWidth,
      child: Row(
        children: List.generate(
          4, // Total number of hearts
          (index) => Icon(
            index < numHearts ? Icons.favorite : Icons.favorite_border,
            color: Colors.red, // Change color to personalize
          ),
        ),
      ),
    );
  }
}