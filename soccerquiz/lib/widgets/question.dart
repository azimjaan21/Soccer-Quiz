import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question;
  final List<Map<String, dynamic>> answers;
  final Function answerForQuestion;

  const QuestionWidget(
      {super.key,
      required this.question,
      required this.answers,
      required this.answerForQuestion});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Text(
              question,
              style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => answerForQuestion(
            answers[0]['isTrue'],
          ),
          child: Text(
            answers[0]['answer'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => answerForQuestion(
            answers[1]['isTrue'],
          ),
          child: Text(
            answers[1]['answer'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => answerForQuestion(
            answers[2]['isTrue'],
          ),
          child: Text(
            answers[2]['answer'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () => answerForQuestion(
            answers[3]['isTrue'],
          ),
          child: Text(
            answers[3]['answer'],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
