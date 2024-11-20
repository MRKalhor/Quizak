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
      home: wellcomepage(),
      routes: {
        '/help': (context) => helppage(),
        '/home': (context) => wellcomepage(),
        '/quiz': (context) => quizpage(),
        '/result': (context) => resultpage(),
      },
    );
  }
}
