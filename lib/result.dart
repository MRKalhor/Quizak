import 'package:flutter/material.dart';

class resultpage extends StatelessWidget {
  const resultpage({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: const [
            Color.fromARGB(190, 0, 238, 255),
            Color.fromARGB(160, 123, 16, 224),
            Color.fromARGB(190, 0, 238, 255)
          ])
        ),
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
                    Color.fromARGB(255, 253, 255, 124),
                    Color(0xFFFFBC2B),
                    Color.fromARGB(255, 255, 174, 0),
                  ])
                ),
                child: SizedBox(
                  height: 60,
                  width: 350,
                  child: MaterialButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: Text(
                      "بازگشت به صفحه اصلی",
                      style: TextStyle(fontSize: 20),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
