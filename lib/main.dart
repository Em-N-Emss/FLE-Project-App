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
		title: 'Flutter',
		debugShowCheckedModeBanner: false,
    scrollBehavior: MyCustomScrollBehavior(),
		theme: ThemeData(
		primarySwatch: Colors.blue,
		),
		home: Scaffold(
		body: SingleChildScrollView(
			child: Accueil(),
		),
		),
	);
	}
}


