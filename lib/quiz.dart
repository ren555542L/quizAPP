import 'package:flutter/material.dart';
import 'package:quizzy/start_screen.dart';
import 'package:quizzy/question_screen.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/result_screen.dart';

class Quiz extends StatefulWidget {
  // Quiz is a stateful widget, so it can hold state and rebuild when the state changes
  const Quiz(
      {super.key}); // super.key is used to pass the key to the parent class, which is StatefulWidget in this case
  @override // override is used to indicate that we are overriding the createState method of the StatefulWidget class
  State<Quiz> createState() {
    // createState is a method that creates the state for the Quiz widget
    // createState is a method that returns an instance of the _QuizState class
    return _QuizState();
  }
}
// _QuizState is a private class, so it can only be used within this file
// It is a good practice to use private classes for stateful widgets
// to encapsulate the state and logic of the widget
// This way, we can avoid exposing the state and logic to other files
// This is a stateful widget, so it can hold state and rebuild when the state changes
// It is a good practice to use stateful widgets for widgets that need to hold state
// and rebuild when the state changes
// It is also a good practice to use stateful widgets for widgets that need to
// interact with the user, such as forms, buttons, and other interactive widgets
// fetch data from an API or a database, such as lists, grids, and other data-driven widgets
// manage animations, such as transitions, fades, and other animated widgets
// manage complex layouts, such as nested lists, grids, and other complex widgets
// manage complex interactions, such as drag and drop, gestures, and other interactive widgets
// manage their own state and logic
// manage their own lifecycle, such as initState, dispose, and other lifecycle methods
// manage their own dependencies, such as providers, blocs, and other dependency injection methods

// we can make other classes private as well, but it is not necessary
// also functions and others can be private as well, but it is not necessary
class _QuizState extends State<Quiz> {
  // it is important to use the State class to manage the state of the widget
  // _selectedAnswers - it is a private variable, so it can only be used within this class
  List<String> selectedAnswers = []; // to store the selected answers
  // Widget? activeScreen; // indicates it can be null - ?
  var activeScreen = 'start-screen'; // using ternary operator
  // @override
  // void initState() {
  //   // initializing active screen with the class initializing
  //   // activeScreen = StartScreen(switchScreen);
  //   activeScreen = 'questions-screen'; //ternary
  //   super.initState(); // super.initState() is used to call the parent class's initState method
  //   // this is used to initialize the state of the widget
  // }

  // argument in startscreen so that it can indirectly call switchState()
  void switchScreen() {
    setState(() {
      // selectedAnswers = []; // reset selected answers when switching screens
      activeScreen = 'question-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      // if all questions are answered, we can show the results
      setState(() {
        activeScreen = 'result-screen'; // reset to result screen
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = []; // reset selected answers
      activeScreen = 'start-screen'; // reset to start screen
    });
  }

  // this method is used to switch the screen from question screen to result screen
  // it is called when the user answers all the questions
  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'question-screen') {
      screenWidget = QuestionScreen(
        onSelectAnswer: chooseAnswer,
      );
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(
        chosenAnswers: selectedAnswers,
        onRestart: restartQuiz,
      );
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 95, 59, 157),
                Color.fromARGB(255, 97, 53, 218),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
          // child: activeScreen == 'start-screen' //ternary approach
          //     ? StartScreen(switchScreen)
          //     : const QuestionScreen(),
        ),
      ),
    );
  }
}
