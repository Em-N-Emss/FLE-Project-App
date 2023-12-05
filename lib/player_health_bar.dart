import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class PlayerHealthBar extends StatelessWidget {
  final double playerHealth;
  final double barHeight;

  const PlayerHealthBar({
    Key? key,
    required this.playerHealth,
    this.barHeight = 10.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final barWidth = screenWidth * 0.8; // Adjust the width as needed

    int numHearts = (playerHealth / 25).floor(); // Calculate the number of full hearts
    double remainder = playerHealth % 25; // Calculate the remaining health

    return Container(
      height: barHeight,
      width: barWidth,
      child: Row(
        children: List.generate(
          4, // Total number of hearts
          (index) {
            if (index < numHearts) {
              return Icon(
                Icons.favorite,
                color: Colors.red, // Change color to personalize
              );
            } else if (index == numHearts) {
              if (remainder == 0) {
                return Icon(
                  Icons.favorite_border,
                  color: Colors.red, // Change color to personalize
                );
              } else {
                return SizedBox(
                  width: 15, // Adjust the size as needed
                  height: barHeight, // Adjust the size as needed
                  child: Align(
                    alignment: Alignment.topCenter, // Adjust the alignment as needed
                    child: Transform.scale(
                      scale: 2, // Adjust the scale factor as needed
                      child: SvgPicture.asset(
                        'assets/half-heart.svg', // Replace with the path to your half-heart SVG
                        color: Colors.red, // Change color to personalize
                      ),
                    ),
                  ),
                );
              }
            } else {
              return Icon(
                Icons.favorite_border,
                color: Colors.red, // Change color to personalize
              );
            }
          },
        ),
      ),
    );
  }
}