import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
import 'utils/boss_widget.dart';
import 'utils/player_health_bar.dart';
class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {
  final List<Question> _questions = [
    Question("Bout de carton pour voyager ?", ['Le ticket', 'La porte', 'La carte', 'Le siège'], "Le ticket"),
    Question("Je ... le métro.", ['Prends', 'Voyage', 'Prent', 'Monte'], 'Prends'),
    Question("Que dit-on pour s'excuser ?", ['Pardon', 'Merci', 'Au revoir', 'Salut'], 'Pardon'),
    // Add more questions here
  ];

  int _currentQuestionIndex = 0;
  late String selectedAnswer;
  bool _showResult = false;
  int _score = 0; // New variable to keep track of the score
  double _scoreMultiplier = 1; // Score multiplier
  late AnimationController _flameAnimationController;
  double _bossHealth = 100; // Boss health
  late double _maxBossHealth = 100.0; // Define the maxBossHealth variable
  int _consecutiveGoodAnswers = 0; // Add the consecutiveGoodAnswers variable
  double _healthImpactPerQuestion = 5.0; // Define the health impact per question
  String _userChoice = '';
  double _playerHealth = 100; // Player health

    @override
  void initState() {
    super.initState();
    _flameAnimationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _flameAnimationController.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    Color scoreMultiplierColor;
    if (_scoreMultiplier == 3) {
      scoreMultiplierColor = Colors.red;
    } else if (_scoreMultiplier > 1.5) {
      scoreMultiplierColor = Colors.orange;
    } else {
      scoreMultiplierColor = Colors.black;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Séquence 1 : Prendre les transports'),
        backgroundColor: Color.fromARGB(168, 152, 154, 182),
      ),
      //body: Center( // body: SingleChildScrollView( To remove the blank space between the title and question
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fond_app.png'), // Replace with your image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!_showResult) // Hide the question and answers when _showResult is false
              Column(
                children: [
                  Align(
                    child : LimitedBox(
                      maxWidth : 200,
                      maxHeight : 200,
                      child : Lottie.network("https://lottie.host/644bc77a-bff5-44e4-a4b7-0631692f3d19/eIr0zP64im.json"),  
                    )
                  ),
                  Text(
                    _questions[_currentQuestionIndex].questionText,
                    //style: TextStyle(fontSize: 28.0),
                    style: TextStyle(
                      fontSize: 28.0,
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
                  SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: _questions[_currentQuestionIndex]
                            .options
                            .sublist(0, _questions[_currentQuestionIndex].options.length ~/ 2)
                            .map(
                              (option) => ElevatedButton(
                                onPressed: () => _checkAnswer(option),
                                child: Text(option),
                              ),
                            )
                            .toList(),
                      ),
                      SizedBox(width: 16.0),
                      Column(
                        children: _questions[_currentQuestionIndex]
                            .options
                            .sublist(_questions[_currentQuestionIndex].options.length ~/ 2)
                            .map(
                              (option) => ElevatedButton(
                                onPressed: () => _checkAnswer(option),
                                child: Text(option),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ],
              ),
            if (_showResult)
            Align(
              child : LimitedBox(
                maxWidth : 200,
                maxHeight : 200,
                child : Lottie.network("https://lottie.host/178c5a84-09ca-43c5-89e3-2d6e0798b213/2o4VQAe4pK.json"),  
              )
            ),
            if (_showResult)
              Text(
                _userChoice,
                //style: TextStyle(fontSize: 28.0),
                style: TextStyle(
                  fontSize: 28.0,
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
            
            if (_showResult)
              SizedBox(height: 20.0),
            if (_showResult)
              ElevatedButton(
                onPressed: _nextQuestion,
                child: Text('Next Question'),
              ),
            SizedBox(height: 20.0),
            Text(
              'Score: $_score',
              style: TextStyle(
                fontSize: 28.0,
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
            //Multiplicator of good answer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'x',
                  style: TextStyle(
                    fontSize: 28.0,
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
                Visibility(
                  visible: _scoreMultiplier == 3,
                  child: Row(
                    children: [
                      Text(
                        _scoreMultiplier.toString(),
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: scoreMultiplierColor, // Set the text color to white for contrast
                          shadows: [
                            Shadow(
                              color: Colors.white, // Set the shadow color to black
                              blurRadius: 50.0,
                            ),
                          ],
                        ),
                      ),
                      LimitedBox(
                        maxWidth: 70, // Replace with your desired maximum width
                        maxHeight: 70, // Replace with your desired maximum height
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(Colors.orange.shade300, BlendMode.srcIn), // Replace with your desired color
                          child: Lottie.network("https://lottie.host/08feb234-427e-4e39-8980-b2bd36e4334f/fSUf6pumkm.json"),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: _scoreMultiplier != 3,
                  child: Text(
                    _scoreMultiplier.toString(),
                    style: TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                      color: scoreMultiplierColor, // Set the text color to white for contrast
                      shadows: [
                        Shadow(
                          color: Colors.white, // Set the shadow color to black
                          blurRadius: 50.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            BossWidget(
              bossHealth: _bossHealth, // Provide the bossHealth argument here
              maxBossHealth: _maxBossHealth,
              showResult: _showResult,
            ), // Add this line to display the boss widget
            PlayerHealthBar(
              playerHealth: _playerHealth,
              ),
          ],
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
            backgroundColor: Color.fromARGB(248, 55, 60, 8),
            color: Colors.green.shade800,
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
    );
  }

  void _checkAnswer(String selectedAnswer) {
    setState(() {
      _questions[_currentQuestionIndex].selectedAnswer = selectedAnswer;
      _questions[_currentQuestionIndex].isCorrect =
          selectedAnswer == _questions[_currentQuestionIndex].correctAnswer;
      _showResult = true;

      if (_questions[_currentQuestionIndex].isCorrect) {
        _score++; // Increment the score by 1 for each correct answer
         _scoreMultiplier = (_scoreMultiplier + 0.5).clamp(1.0, 3.0); // Increment the score multiplier by 0.5
        _consecutiveGoodAnswers++;
        _userChoice = 'Correcte';

        // Check if the consecutive good answers count is greater than a threshold
        if (_consecutiveGoodAnswers >= 2) {
          _score +=  _scoreMultiplier.toInt(); // Increment the score by the value of the score multiplier
          // Decrease the boss health based on the consecutive good answers
          _bossHealth -= _healthImpactPerQuestion * _scoreMultiplier;
        } else {
          // Decrease the boss health by the regular health impact per question
          _bossHealth -= _healthImpactPerQuestion;
        }
      } else {
        _scoreMultiplier = 1; // Reset the score multiplier
        _consecutiveGoodAnswers = 0; // Reset the consecutive good answers count if the answer is incorrect
        _userChoice = 'Incorrecte';
        _playerHealth -= 12.5; // Decrease the player's health by 10 for incorrect answers
      }
      _showResult = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_bossHealth <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'You win!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            duration: Duration(days: 365), // Set a very long duration to make the SnackBar stay visible
            backgroundColor: Colors.green,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            action: SnackBarAction(
              label: 'Restart',
              onPressed: () {
                // Reset the game
                _resetGame();
              },
            ),
          ),
        );
        // Reset the game or navigate to a new screen
        return;
      }

      if (_playerHealth <= 0) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Container(
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow,
                  ),
                  SizedBox(width: 8.0),
                  Text(
                    'You loose!',
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            duration: Duration(days: 365), // Set a very long duration to make the SnackBar stay visible
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 16.0,
            ),
            action: SnackBarAction(
              label: 'Restart',
              onPressed: () {
                // Reset the game
                _resetGame();
              },
            ),
          ),
        );
        // Reset the game or navigate to a new screen
        return;
      }
      _currentQuestionIndex = Random().nextInt(_questions.length); // Randomly select next question
      _userChoice = '';
      _showResult = false;
    });
  }

  void _resetGame() {
    // Add logic to reset the game state
    // For example, reset the boss health, current question index, and other relevant variables
    setState(() {
      _bossHealth = 100;
      _playerHealth = 100;
      _currentQuestionIndex = 0;
      _showResult = false;
      _score = 0;
      _scoreMultiplier = 1;
      _consecutiveGoodAnswers = 0;
    });
  }
}

class Question {
  final String questionText;
  final List<String> options;
  String correctAnswer;
  String selectedAnswer = '';
  bool isCorrect = false;

  Question(this.questionText, this.options, this.correctAnswer);
}

class FrenchQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'French Quizz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}
