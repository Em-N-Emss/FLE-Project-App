import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'utils/utils.dart';
import 'utils/home.dart';
import 'french_quizz_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
        body: Navigator(
          key: navigatorKey,
          initialRoute: '/',
          onGenerateRoute: (RouteSettings settings) {
            WidgetBuilder builder;
            switch (settings.name) {
              case '/':
                builder = (_) => Accueil();
                break;
              case '/quiz':
                builder = (_) => QuizPage();
                break;
              // Add your other pages here
              case '/settings':
                builder = (_) => Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Settings Page'),
                      ),
                    );
                break;
              default:
                throw Exception('Invalid route: ${settings.name}');
            }
            return MaterialPageRoute(builder: builder, settings: settings);
          },
        ),
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Color.fromARGB(248, 55, 60, 8),
          color: Colors.green.shade800,
          animationDuration: Duration(milliseconds: 300),
          onTap: (index) {
            switch (index) {
              case 0:
                navigatorKey.currentState?.pushNamed('/');
                break;
              case 1:
                navigatorKey.currentState?.pushNamed('/quiz');
                break;
              case 2:
                navigatorKey.currentState?.pushNamed('/settings');
                break;
              default:
                throw Exception('Invalid index: $index');
            }
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
