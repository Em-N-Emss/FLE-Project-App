import 'package:flutter/material.dart';
import 'dart:math';
import 'boss_widget.dart';

void main() {
  runApp(FrenchQuizApp());
}

class FrenchQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'French Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> _questions = [
    Question('Bonjour', ['Hello', 'Goodbye', 'Thank you', 'Please'], 'Hello'),
    Question('Merci', ['Please', 'Hello', 'Thank you', 'Goodbye'], 'Thank you'),
    Question('Oui', ['No', 'Yes', 'Maybe', 'Never'], 'Yes'),
    // Add more questions here
  ];

  int _currentQuestionIndex = 0;
  String selectedAnswer = '';
  bool _showResult = false;
  int _score = 0; // New variable to keep track of the score
  double _scoreMultiplier = 0.0; // Score multiplier
  double _bossHealth = 100; // Boss health
  double _maxBossHealth = 100.0; // Define the maxBossHealth variable
  int _consecutiveGoodAnswers = 0; // Add the consecutiveGoodAnswers variable
  double _healthImpactPerQuestion =
      10.0; // Define the health impact per question

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FLE-Project French Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showResult
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _questions[_currentQuestionIndex].isCorrect
                            ? 'Correct!'
                            : 'Incorrect!',
                        style: TextStyle(fontSize: 24.0),
                      ),
                      ElevatedButton(
                        onPressed: _nextQuestion,
                        child: Text('Next Question'),
                      ),
                      Text(
                        'Score: $_score',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _questions[_currentQuestionIndex].questionText,
                        style: TextStyle(fontSize: 24.0),
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: _questions[_currentQuestionIndex]
                            .options
                            .map((option) => ElevatedButton(
                                  onPressed: () => _checkAnswer(option),
                                  child: Text(option),
                                ))
                            .toList(),
                      ),
                      Text(
                        'Score: $_score',
                        style: TextStyle(fontSize: 24.0),
                      ),
                    ],
                  ),
            SizedBox(height: 20.0),
            LinearProgressIndicator(
              value: _bossHealth /
                  100, // Replace 100 with the maximum boss health value
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
            BossWidget(
              bossHealth: _bossHealth, // Provide the bossHealth argument here
              maxBossHealth: _maxBossHealth,
              showResult: _showResult,
            ), // Add this line to display the boss widget
          ],
        ),
      ),
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
        _score += (_score * _scoreMultiplier)
            .toInt(); // Increment the score by the value of the score multiplier
        _scoreMultiplier += 0.5; // Increment the score multiplier by 0.5
        _consecutiveGoodAnswers++;

        // Check if the consecutive good answers count is greater than a threshold
        if (_consecutiveGoodAnswers >= 3) {
          _scoreMultiplier = (_scoreMultiplier + 0.5).clamp(1.0, 2.0);
          // Decrease the boss health based on the consecutive good answers
          _bossHealth -= _healthImpactPerQuestion * _scoreMultiplier;
        } else {
          // Decrease the boss health by the regular health impact per question
          _bossHealth -= _healthImpactPerQuestion;
        }
      } else {
        _scoreMultiplier = 0.0; // Reset the score multiplier
        _consecutiveGoodAnswers =
            0; // Reset the consecutive good answers count if the answer is incorrect
      }
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
      _currentQuestionIndex =
          Random().nextInt(_questions.length); // Randomly select next question
      _showResult = false;
    });
  }

  void _resetGame() {
    // Add logic to reset the game state
    // For example, reset the boss health, current question index, and other relevant variables
    setState(() {
      _bossHealth = 100;
      _currentQuestionIndex = 0;
      _showResult = false;
      _score = 0;
      _scoreMultiplier = 0.0;
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
