import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer); // call the callback function
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

    return SizedBox(
      width: double.infinity, // make the container as wide as possible
      child: Container(
        margin: const EdgeInsets.all(40), // add margin around the container
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // center the content vertically
          crossAxisAlignment: CrossAxisAlignment.stretch, // stretch the content horizontally
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 172, 124, 255),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledAnswers.map((answer) {
              return AnswerButton(
                answerText: answer,
                onAnswer: () {
                  answerQuestion(answer);
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
