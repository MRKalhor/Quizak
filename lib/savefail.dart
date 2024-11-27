import 'package:flutter/material.dart';
import 'dart:math';

class SaveFail extends StatefulWidget {
  const SaveFail({super.key});

  @override
  State<SaveFail> createState() => _SaveFailState();
}

int s = Random().nextInt(1000);

class _SaveFailState extends State<SaveFail> {
  @override
  Widget build(BuildContext context) {
    var current = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("SaveFail"),
      ),
      body: Expanded(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: current <= 500
                      ? [
                          Color(0xFF4E65FF),
                          Color(0xFF8F55FF),
                          Color(0xFF6A3BFF),
                        ]
                      : current <= 900
                          ? [
                              Color.fromARGB(255, 99, 255, 85),
                              Color.fromARGB(255, 255, 99, 78),
                              Color.fromARGB(255, 85, 255, 93),
                            ]
                          : [
                              Color.fromARGB(255, 255, 85, 204),
                              Color.fromARGB(255, 78, 249, 255),
                              Color.fromARGB(255, 255, 85, 241),
                            ])),
          child: Column(
            children: [
              Text(current.toString()),
              for (int i = 0; i < s; i++) Text(i.toString()),
            ],
          ),
        ),
      ),
    );
  }
}
