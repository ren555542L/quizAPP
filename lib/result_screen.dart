import 'package:flutter/material.dart';
import 'package:quizzy/data/questions.dart';
import 'package:quizzy/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswers, required this.onRestart});
  final List<String> chosenAnswers;
  final void Function() onRestart;

// Map - is a datatype that holds key-value pairs

// get summaryData() is a method that returns a list of maps
  // It is used to summarize the quiz results
  // It will create a list of maps, where each map contains the question index, question
  // text, user answer, and correct answer
  // This method will be called in the build method to get the summary data
//List<Map<String, Object>> get summaryData() {  --  like this
  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
// This will hold the summary of the quiz results
    // Loop through the chosen answers and create a summary
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'user_answer': chosenAnswers[i],
        'correct_answer': questions[i].answers[0],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
// arrow function - is a shorthand for a function that returns a value
// It is used to create a function that returns a value without using the return keyword
    final numCorrectAnswers = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;
    // if you have only return statement, you can use arrow function
// where - is a method that filters the list based on a condition
// it returns a new list with the elements that satisfy the condition

    return SizedBox(
      //alternative to cover full screen
      width: double.infinity, //take as much width as you can
      child: Container(
        margin: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //center the content vertically
          children: [
            Text(
              'You answered $numCorrectAnswers out of $numTotalQuestions questions correctly!',
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionSummary(summaryData),
            Text('List of answer and question'),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh, color: Colors.white),
              label: const Text("Restart Quiz!!"),
            ),
          ],
        ),
      ),
    );
  }
}
