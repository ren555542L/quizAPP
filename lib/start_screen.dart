import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function()
      startQuiz; // function made to start the quiz and navigate to the quiz screen
  // this function will be passed from the Quiz class to the StartScreen class
  // this function will be called when the user taps the start button
  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            height: 300,
            color: const Color.fromARGB(150, 255, 255, 255),
          ),
          SizedBox(height: 60),
          Text(
            'Start Learning about C++',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 60),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz(); // startQuiz will do the navigation to the quiz screen
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt, color: Colors.white),
            label: Text(
              'Start Quiz',
            ),
          ),
        ],
      ),
    );
  }
}
