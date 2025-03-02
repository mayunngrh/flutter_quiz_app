import 'package:flutter_quiz_app/models/quiz_question.dart';

const questions = [
  QuizQuestion(
      "What is the primary programming language used to develop Flutter apps?",
      ["Dart", "Java", "Kotlin", "Swift"]),
  QuizQuestion(
      "Which widget is used to create a vertically scrollable list in Flutter?",
      ["ListView", "Column", "Row", "Stack"]),
  QuizQuestion("How do you display text in Flutter?", [
    "Text(\"Hello, Flutter!\")",
    "Label(\"Hello, Flutter!\")",
    "Display(\"Hello, Flutter!\")",
    "ShowText(\"Hello, Flutter!\")"
  ]),
  QuizQuestion("What is the main purpose of setState() in a StatefulWidget?", [
    "To update the UI",
    "To delete a widget",
    "To execute an async function",
    "To close the app"
  ]),
  QuizQuestion(
      "Which layout widgets are used to position widgets flexibly in Flutter?",
      ["Column & Row", "ListView", "GridView", "Table"]),
  QuizQuestion("What must be included in the build() function in Flutter?", [
    "A return statement with a Widget",
    "A return statement with an int",
    "A return statement with a String",
    "A return statement with a boolean"
  ])
];
