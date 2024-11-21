import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      // extendBodyBehindAppBar: false,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      // ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _container(
                "هدف بازی", "در این بازی شما باید کلمات را به درستی حدس بزنید"),
            _container(
                "نحوه بازی", "با کلیک روی حروف، کلمه مورد نظر را بسازید"),
            _container("امتیازات", "با هر حدس درست ۱۰ امتیاز دریافت می‌کنید"),
            _container("راهنمایی",
                "از راهنمایی‌های موجود برای حدس کلمات استفاده کنید"),
            SizedBox(height: 10),
            SizedBox(
                height: 60,
                width: 350,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(Colors.white),
                      shape: WidgetStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
                  child: Text(
                    "برگشت ",
                    style: TextStyle(fontStyle: FontStyle.normal, fontSize: 30),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

Widget _container(String title, String about) {
  return Container(
    width: 330,
    height: 150,
    margin: const EdgeInsets.all(20),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      gradient: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xFF7DF9FF), // آبی روشن
          Color(0xFF00CCFF), // آبی فیروزه‌ای
          Color(0xFF0099FF), // آبی آسمانی
        ],
      ),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          spreadRadius: 2,
        ),
      ],
      borderRadius: BorderRadius.circular(20),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 30,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Text(
          about,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white.withOpacity(0.9),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
