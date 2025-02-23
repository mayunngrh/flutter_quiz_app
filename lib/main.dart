import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
              title: Text("FLUTTER QUIZ APP"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(64),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.indigo],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter),
          ),
          child: Column(
            children: [
              Image(image: AssetImage('assets/images/quiz-logo.png')),
              SizedBox(
                height: 36,
              ),
              Text(
                "Learn Flutter the fun way!",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 12,
              ),
              TextButton(
                onPressed: startButton,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Start Now!",
                  ),
                ),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
              ),

            ],
          ),
        ));
  }
}
