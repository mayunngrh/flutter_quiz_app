import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/quiz.dart';

void main() {
  runApp(MyMainView());
}

class MyMainView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

void startButton() {}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.deepPurple, Colors.indigo],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            child: AppBar(
              title: Text("FLUTTER QUIZ APP", style: TextStyle(color: Colors.white),),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
        body: Quiz()
    );
  }
}
