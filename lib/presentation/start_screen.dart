import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget{
  final VoidCallback onClick;
  const StartScreen(this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
            width: double.infinity,
            child: TextButton.icon(
              onPressed: onClick,
              style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.all<Color>(Colors.white)),
              icon: Icon(Icons.chevron_right_outlined),
              label: Text(
                "Start Now!",
              ),
            ),
          ),
        ],
      ),
    );
  }
}