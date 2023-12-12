import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fle_project/french_quizz_app.dart';
import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'utils/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0; // Initialize _currentIndex here
  
  void updateIndex(int newIndex) {
    setState(() {
      _currentIndex = newIndex;
    });
  }

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
        body: IndexedStack(
          index: _currentIndex,
          children: [
            SingleChildScrollView(
              child: Accueil(),
            ),
            QuizPage(),
            // Add your other pages here
            Container(
              color: Colors.blue,
              child: Center(
                child: Text('Settings Page'),
              ),
            ),
          ],
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(248, 55, 60, 8),
          color: Colors.green.shade800,
          animationDuration: Duration(milliseconds: 300),
          index: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index; // Update the current index here
            });
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
          ],
        ),
      ),
    );
  }
}