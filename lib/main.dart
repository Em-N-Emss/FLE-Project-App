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
  int _bossHealth = 100; // Boss health

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('French Quiz'),
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
                      BossWidget(), // Add this line to display the boss widget
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
              value: _bossHealth / 100, // Replace 100 with the maximum boss health value
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
            ),
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
        _score += _scoreMultiplier.toInt(); // Increment the score by the value of the score multiplier
        _scoreMultiplier += 0.5; // Increment the score multiplier by 0.5
         _bossHealth -= 10; // Decrement the boss health by 10 for each correct answer
      } else {
        _scoreMultiplier = 0.0; // Reset the score multiplier
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _currentQuestionIndex = Random().nextInt(_questions.length); // Randomly select next question
      _showResult = false;
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
