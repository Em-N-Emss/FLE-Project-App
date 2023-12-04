import 'package:flutter/material.dart';

class HealthBar extends StatelessWidget {
  final double health;
  final double barHeight;

  const HealthBar({
    Key? key,
    required this.health,
    this.barHeight = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final barWidth = screenWidth * 0.8; // Adjust the width as needed

    return Container(
      height: barHeight,
      width: barWidth,
      child: LinearProgressIndicator(
        value: health / 100, // Assuming health is a value between 0 and 100
        backgroundColor: Colors.grey[300],
        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
      ),
    );
  }
}