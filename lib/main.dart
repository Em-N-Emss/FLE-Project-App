import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'utils/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FLE-Project',
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Accueil(),
        ),
        bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Colors.deepPurple,
            color: Colors.deepPurple.shade300,
            animationDuration: Duration(milliseconds: 300),
            onTap: (index) {
              print(index);
            },
            items: [
              Icon(
                Icons.home,
                color: Colors.white,
              ),
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ]),
      ),
    );
  }
}
