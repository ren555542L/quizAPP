import 'package:flutter/material.dart';
import 'package:quizzy/answer_button.dart';
import 'package:quizzy/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
  var currentQuestionIndex = 0;
  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      // tells flutter that the state has changed and it needs to rebuild the widget
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return SizedBox(
      //alternative to cover full screen
      width: double.infinity, //take as much width as you can
      child: Container(
        margin: EdgeInsets.all(40), //add margin around the container
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.center, //center the content vertically
          crossAxisAlignment:
              CrossAxisAlignment.stretch, //take as much width as you can
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // shuffle changes the original list, so we can use it to randomize the answers
            //if you dont want change the original list, use shuffle() on a copy of the list
            ...currentQuestion.getShuffledAnswers().map((item) {
              //getShufflesAnswers() created in quiz_questions.dart
              // This is a way to iterate over the answers
              // return AnswerButton(answerText: item, onTap: () {});
              //map returns a new list, so we can use it to create widgets
              // We can use the map function to create a list of widgets
              // map yeilds an iterable, so we need to convert it to a list
              // We can use the toList() method to convert it to a list
              return AnswerButton(
                answerText: item, //answer text is the item from the list
                // item is the answer text from the list of answers
                // answerText is a property of the AnswerButton class
                // item automatically gets the value of the answer text
                onTap: () {
                  answerQuestion(
                      item); // call the answerQuestion function when the button is tapped
                },
              );
            }) // ... -> spread operator, it takes the list and spreads it into the widget tree
          ],
        ),
      ),
    );
  }
}
