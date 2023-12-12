import 'package:flutter/material.dart';


class BossWidget extends StatelessWidget {
  final double bossHealth;
  final double maxBossHealth;
  final bool showResult;

  const BossWidget({
    required this.bossHealth,
    required this.maxBossHealth,
    required this.showResult,
  });

  @override
  Widget build(BuildContext context) {
    double healthPercentage = bossHealth.clamp(0, maxBossHealth) / maxBossHealth;
    double barWidth = MediaQuery.of(context).size.width * 0.8; // Adjust the width as needed

    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
      child: Column(
        children: [
          Text(
            'Boss Health',
            //style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set the text color to white for contrast
              shadows: [
                Shadow(
                  color: Colors.white, // Set the shadow color to black
                  blurRadius: 50.0,
                ),
              ],
            ),
          ),
          SizedBox(height: 8.0),
          Stack(
            children: [
              Container(
                width: barWidth,
                height: 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.grey.shade300,
                ),
              ),
              FractionallySizedBox(
                widthFactor: bossHealth > 0.0 ? healthPercentage : 0.0,
                child: Container(
                  width: barWidth,
                  height: 20.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.red,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 8.0),
          Text(
            '${(healthPercentage * 100).toStringAsFixed(0)}%',
            //style: TextStyle(fontSize: 16.0),
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black, // Set the text color to white for contrast
              shadows: [
                Shadow(
                  color: Colors.white, // Set the shadow color to black
                  blurRadius: 50.0,
                ),
              ],
            ),
          ),
          if (showResult && bossHealth <=0)
            Text(
              'Boss defeated!',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
        ],
      ),
    );
  }
}