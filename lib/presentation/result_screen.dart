import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.userAnswer, {super.key});

  final List<String> userAnswer;

  List<Map<String, Object>> getsummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < userAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].question,
          'correct_answer': questions[i].answer[0],
          'user_answer': userAnswer[i]
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summary = getsummaryData();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "You Answer X out of Y questions correctly!",
            style: GoogleFonts.montserrat(
              fontSize: 14,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          ...summary.map((question) {
            return Row(
              children: [
                Text(question['question_index'].toString()),
                Expanded(
                    child: Column(
                  children: [
                    Text(question['question'].toString()),
                    Text(question['user_answer'].toString()),
                    Text(question['correct_answer'].toString()),
                  ],
                ))
              ],
            );
          }),
        ],
      ),
    );
  }
}
