import 'package:flutter/material.dart';
import '/result.dart';
import '/help.dart';
import '/quiz.dart';
import 'wellcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WellcomePage(),
      routes: {
        '/help': (context) => HelpPage(),
        '/home': (context) => WellcomePage(),
        '/quiz': (context) => QuizPage(),
        '/result': (context) => Resultpage(),
      },
    );
  }
}
