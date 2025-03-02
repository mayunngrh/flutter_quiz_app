import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/widgets/answer_button.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen(this.chooseAnswer, {super.key});

  final Function(String answer) chooseAnswer;

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentQuestionIndex = 0;

  void answerQuestion(String answer) {
    setState(() {
      widget.chooseAnswer(answer);
      // ✅ Correct way to update state
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        // Optionally handle the end of the quiz here (e.g., show results)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            currentQuestion.question,
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ...currentQuestion.getShuffleAnswer().map((answer) {
            return AnswerButton(() {
              answerQuestion(answer);
            }, answer); // Pass the callback function
          }).toList(),
        ],
      ),
    );
  }
}
