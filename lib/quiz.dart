import 'dart:convert';

import "package:flutter/material.dart";
import 'package:http/http.dart' as http;

class quizpage extends StatefulWidget {
  const quizpage({super.key});

  @override
  State<quizpage> createState() => _quizpageState();
}

class _quizpageState extends State<quizpage> {
  var questions = [];
  var index = 0;
  var rightanswercount = 0;
  var falseanswercount = 0;
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
      print("Eror failed to take data $e");
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void Validate(i) {
    if (questions[index]['answerindex'] == i) {
      setState(() {
        rightanswercount++;
      });
    } else {
      falseanswercount++;
    }
    if (index < questions.length - 1) {
      setState(() {
        index++;
      });
    } else {
      Navigator.pushNamed(context, '/result', arguments: {
        'right': rightanswercount,
        'false': falseanswercount,
        'total': questions.length,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (questions.isEmpty) {
      return Scaffold(
        body: Center(
          child: Text("failed to take data"),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // title: Text("${"Level " + questions[index]['level']} of 4"),
        foregroundColor: Colors.black,
      ),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 550,
            color: Colors.lightBlueAccent,
            child: Center(
              child: Text(
                (questions)[index]['question'],
                style: TextStyle(
                    fontSize: 25, color: const Color.fromARGB(255, 0, 0, 0)),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: const [
                Color.fromARGB(190, 0, 238, 255),
                Color.fromARGB(160, 123, 16, 224),
                Color.fromARGB(190, 0, 238, 255)
              ])),
              width: double.infinity,
              height: 300,
              // color: const Color.fromARGB(255, 137, 64, 255),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 253, 255, 124),
                              Color(0xFFFFBC2B),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0)
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 60,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  Validate(0);
                                },
                                child: Text(questions[index]['options'][0]))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(16.0)),
                          gradient: LinearGradient(
                            colors: const [
                              Color.fromARGB(255, 253, 255, 124),
                              Color(0xFFFFBC2B),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0)
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 60,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  Validate(1);
                                },
                                child: Text(questions[index]['options'][1]))),
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
                              Color.fromARGB(255, 253, 255, 124),
                              Color(0xFFFFBC2B),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0)
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 60,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  Validate(2);
                                },
                                child: Text(questions[index]['options'][2]))),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16.0)),
                          gradient: LinearGradient(
                            colors: [
                              Color.fromARGB(255, 253, 255, 124),
                              Color(0xFFFFBC2B),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0),
                              Color.fromARGB(255, 255, 174, 0)
                            ],
                          ),
                        ),
                        child: SizedBox(
                            height: 60,
                            width: 200,
                            child: MaterialButton(
                                onPressed: () {
                                  Validate(3);
                                },
                                child: Text(questions[index]['options'][3]))),
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
