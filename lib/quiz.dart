import 'dart:convert';
import 'dart:math';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = [];
  var randomNumbers = <int>[];
  var index = 0;
  var titlecount = 1;
  var rightanswercount = 0;
  var falseanswercount = 0;
  var boolcolor;
  bool isLoading = true;

  Future<void> fetchData() async {
    try {
      var result = await http.get(Uri.parse(
          "https://mrkalhor.github.io/api-for-quiz-time/Updated_Unique_Data.json"));
      var jsonData = jsonDecode(result.body);
      setState(() {
        questions = jsonData['result'];
        isLoading = false;
      });
    } catch (e) {
      Text("Eror failed to take data $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  void generateRandomNumbers() {
    final random = Random();
    final numbers = <int>[];

    while (numbers.length < 5) {
      int randomNumber = random.nextInt(questions.length);
      if (!numbers.contains(randomNumber)) {
        numbers.add(randomNumber);
      }
    }

    setState(() {
      randomNumbers = numbers;
      index = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchData().then((_) {
      generateRandomNumbers();
    });
  }

  void validate(i) {
    if (questions[randomNumbers[index]]['answerindex'] == i) {
      setState(() {
        boolcolor = 1;
        rightanswercount++;
      });
    } else {
      setState(() {
        boolcolor = 2;
        falseanswercount++;
      });
    }

    Future.delayed(const Duration(milliseconds: 500), () {
      if (index < 4) {
        setState(() {
          index++;
          titlecount++;
          boolcolor = 3;
        });
      } else {
        Navigator.pushNamed(context, '/result', arguments: {
          'right': rightanswercount,
          'false': falseanswercount,
          'total': randomNumbers.length,
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                    Color.fromARGB(190, 0, 238, 255),
                    Color.fromARGB(104, 132, 0, 255),
                    Color.fromARGB(190, 0, 238, 255)
                  ])),
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Center(
                        child: CircularProgressIndicator(),
                      )
                    ],
                  ),
                ),
              )
            ],
          ));
    }

    if (questions.isEmpty) {
      return Scaffold(
          backgroundColor: Colors.lightBlueAccent,
          body: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: const [
                    Color.fromARGB(190, 0, 238, 255),
                    Color.fromARGB(104, 132, 0, 255),
                    Color.fromARGB(190, 0, 238, 255)
                  ])),
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Center(
                        child: Text("failed to take data"),
                      )
                    ],
                  ),
                ),
              )
            ],
          ));
    }

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Question $titlecount of ${randomNumbers.length}"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text("${"Level " + questions[index]['level']} of 4"),
        foregroundColor: Colors.black,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: const [
                Color.fromARGB(190, 0, 238, 255),
                Color.fromARGB(104, 132, 0, 255),
                Color.fromARGB(190, 0, 238, 255)
              ])),
              width: double.infinity,
              height: 300,
              // color: const Color.fromARGB(255, 137, 64, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromARGB(255, 69, 115, 241),
                        border: Border.all(
                            color: boolcolor == 1
                                ? Colors.green
                                : boolcolor == 2
                                    ? Colors.red
                                    : Colors.transparent),
                        boxShadow: [
                          BoxShadow(
                            color: boolcolor == 1
                                ? Colors.green
                                : boolcolor == 2
                                    ? Colors.red
                                    : Colors.transparent,
                            spreadRadius: 5,
                            blurRadius: 9,
                            offset: const Offset(0, 3),
                          ),
                        ]),
                    width: 400,
                    height: 200,
                    // color: Colors.lightBlueAccent,
                    child: Center(
                      child: Text((questions)[randomNumbers[index]]['question'],
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4E65FF), // آبی روشن
                              Color(0xFF8F55FF), // بنفش
                              Color(0xFF6A3BFF),
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 180,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  validate(0);
                                },
                                child: Text(
                                    questions[randomNumbers[index]]['options']
                                        [0],
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4E65FF), // آبی روشن
                              Color(0xFF8F55FF), // بنفش
                              Color(0xFF6A3BFF),
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 180,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  validate(1);
                                },
                                child: Text(
                                    questions[randomNumbers[index]]['options']
                                        [1],
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4E65FF), // آبی روشن
                              Color(0xFF8F55FF), // بنفش
                              Color(0xFF6A3BFF),
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 180,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  validate(2);
                                },
                                child: Text(
                                    questions[randomNumbers[index]]['options']
                                        [2],
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color(0xFF4E65FF), // آبی روشن
                              Color(0xFF8F55FF), // بنفش
                              Color(0xFF6A3BFF),
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 180,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  validate(3);
                                },
                                child: Text(
                                    questions[randomNumbers[index]]['options']
                                        [3],
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.white,
                                    ),
                                    textAlign: TextAlign.center))),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
