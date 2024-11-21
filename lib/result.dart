import 'package:flutter/material.dart';

class Resultpage extends StatelessWidget {
  const Resultpage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: const [
          Color.fromARGB(190, 0, 238, 255),
          Color.fromARGB(104, 132, 0, 255),
          Color.fromARGB(190, 0, 238, 255)
        ])),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "نتیجه آزمون شما",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),
              Text(
                "پاسخ‌های درست: ${data['right']}",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                "پاسخ‌های نادرست: ${data['false']}",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                "تعداد کل سوالات: ${data['total']}",
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 50),
              Container(
                decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    gradient: LinearGradient(colors: const [
                      Color(0xFF4E65FF), // آبی روشن
                      Color(0xFF8F55FF), // بنفش
                      Color(0xFF6A3BFF),
                    ])),
                child: SizedBox(
                  height: 60,
                  width: 350,
                  child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text(
                        "شروع دوباره",
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
