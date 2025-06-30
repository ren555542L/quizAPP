import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  // const AnswerButton(this.answerText, this.onTap, {super.key}); -- M1
  const AnswerButton(
      {super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;
  @override
  Widget build(context) {
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 40, 0),
      child: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, //center the content vertically
        crossAxisAlignment: CrossAxisAlignment.stretch, // to take minimum space
        children: [
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              backgroundColor: const Color.fromARGB(255, 96, 28, 255),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
            ),
            child: Text(
              answerText,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 10,
          ), // Add some space between buttons
        ],
      ),
    );
  }
}
