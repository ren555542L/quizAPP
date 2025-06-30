import 'package:quizzy/models/quiz_question.dart';

const questions = [
  QuizQuestion(
    // quiz question is a class that holds the question and answers
    'What is C++ used for?',
    [
      'All',
      'Mobile app development',
      'Game development',
      'System programming',
    ],
    // create a copy of the answers list, shuffle it, and return the shuffled list
  ),
  QuizQuestion('What is C++?', [
    'A programming language',
    'A type of software',
    'A hardware component',
    'A web framework',
  ]),
  QuizQuestion(
    'What are loops in C++ used for?',
    [
      'Repeating a block of code',
      'Creating functions',
      'Declaring variables',
      'Defining classes',
    ],
  ),
  QuizQuestion(
    'What is the purpose of a function in C++?',
    [
      'To perform a specific task',
      'To declare variables',
      'To create loops',
      'To define classes',
    ],
  ),
  QuizQuestion(
    'What is a class in C++?',
    [
      'A blueprint for creating objects',
      'A type of variable',
      'A type of loop',
      'A type of function',
    ],
  ),
  QuizQuestion(
    'What are pointers in C++ used for?',
    [
      'Storing memory addresses',
      'Declaring variables',
      'Creating loops',
      'Defining classes',
    ],
  ),
];
