import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(this.restartButton, this.userAnswer, {super.key});

  final Function restartButton;
  final List<String> userAnswer;

  List<Map<String, Object>> getsummaryData() {
    List<Map<String, Object>> summary = [];

    for (int i = 0; i < userAnswer.length; i++) {
      summary.add(
        {
          'question_index': i + 1,
          'question': questions[i].question,
          'correct_answer': questions[i].answer[0],
          'user_answer': userAnswer[i],
          'is_correct': userAnswer[i] == questions[i].answer[0],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    var summary = getsummaryData();
    int correctAnswer = summary.where((item) => item['is_correct'] as bool).length;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo], // Gradient colors
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with result text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                child: Text(
                  "You Answered $correctAnswer out of ${summary.length} questions correctly!",
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // List of questions inside Expanded
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: summary.length,
                    itemBuilder: (context, index) {
                      var question = summary[index];
                      bool isCorrect = question['is_correct'] as bool;

                      return Card(
                        color: Colors.white.withOpacity(0.15), // Semi-transparent card
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 4,
                        margin: const EdgeInsets.only(bottom: 12),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Correct/Wrong Icon
                              Icon(
                                isCorrect ? Icons.check_circle : Icons.cancel,
                                color: isCorrect ? Colors.greenAccent : Colors.redAccent,
                                size: 28,
                              ),
                              const SizedBox(width: 12),

                              // Question details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Question ${question['question_index']}:",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      question['question'].toString(),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.white,
                                      ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      "Your Answer: ${question['user_answer']}",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: isCorrect ? Colors.greenAccent : Colors.redAccent,
                                      ),
                                    ),
                                    Text(
                                      "Correct Answer: ${question['correct_answer']}",
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14,
                                        color: Colors.greenAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Play Again Button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () {
                    restartButton();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    "Restart The Quiz!",
                    style: GoogleFonts.montserrat(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
