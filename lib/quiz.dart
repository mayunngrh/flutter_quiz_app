import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/presentation/quiz_screen.dart';
import 'package:flutter_quiz_app/presentation/result_screen.dart';
import 'package:flutter_quiz_app/presentation/start_screen.dart';

class Quiz extends StatefulWidget {
  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz>{
  String? currentScreen;
  List<String> selectedAnswer = [];


  @override
  void initState() {
    currentScreen = 'start-screen';
    super.initState();
  }

  void onStartClick(){
    setState(() {
      currentScreen = 'quiz-screen';
    });
  }

  void chooseAnswer(String answer){
    selectedAnswer.add(answer);
    if(selectedAnswer.length == questions.length){
      setState(() {
        currentScreen = 'result-screen';
      });
    }
    //print("NILAI SELECTED ANSWER: $selectedAnswer");
    print("NILAI SELECTED ANSWER LENGTH: ${selectedAnswer.length}");
    print("NILAI QUESTIONS LENGTH: ${questions.length}");
  }

  void restart(){
    setState(() {
      currentScreen = 'start-screen';
      selectedAnswer = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget? screenWidget;

    switch (currentScreen){
      case "start-screen":
        screenWidget = StartScreen(onStartClick);
        break;
      case "quiz-screen":
        screenWidget = QuizScreen(chooseAnswer);
        break;
      case "result-screen":
        screenWidget = ResultScreen(restart,selectedAnswer);
        break;
    }

    return Container(
      padding: EdgeInsets.all(36),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter),
      ),
      child: screenWidget,
    );
  }
}