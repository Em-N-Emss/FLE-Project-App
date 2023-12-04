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
    return Column(
      children: [
        if (showResult)
          LinearProgressIndicator(
            value: bossHealth / maxBossHealth,
            backgroundColor: Colors.grey,
            valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
          ),
      ],
    );
  }
}