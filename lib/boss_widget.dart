import 'package:flutter/material.dart';

class BossWidget extends StatefulWidget {
  @override
  _BossWidgetState createState() => _BossWidgetState();
}
class _BossWidgetState extends State<BossWidget> {
  double _bossHealth = 100.0; // Replace 100.0 with the starting boss health value
  double maxBossHealth = 100.0; // Replace 100.0 with the maximum boss health value

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Health Bar
        LinearProgressIndicator(
          value: _bossHealth / maxBossHealth,
          backgroundColor: Colors.grey,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
        ),
        // Other boss-related widgets
        // ...
      ],
    );
  }
}