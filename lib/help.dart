import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: const [
            Color.fromARGB(190, 0, 238, 255),
            Color.fromARGB(104, 132, 0, 255),
            Color.fromARGB(190, 0, 238, 255)
          ]),
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _container("هدف بازی",
                  "این بازی برای به چالش کشیدن و مهک زدن اطلاعات عمومی شماست"),
              _container("نحوه بازی",
                  "شما باید جواب درست رو حدس بزنید  و جواب درست رو انتخاب کنید در صورت درست بودن جواب شما چرا غ سبز ور در صورت اشتباه بودن چراغ قرمز برای شما روشن می شود"),
              _container("امتیازات", "با هر حدس  درست 1 امتیاز دریافت می‌کنید"),
              SizedBox(height: 10.r),
              Container(
                  decoration: ShapeDecoration(
                      shape: StadiumBorder(),
                      gradient: LinearGradient(colors: const [
                        Color(0xFF4E65FF), // آبی روشن
                        Color(0xFF8F55FF), // بنفش
                        Color(0xFF6A3BFF),
                      ])),
                  child: SizedBox(
                      height: 60.r,
                      width: 350.r,
                      child: MaterialButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/home');
                          },
                          child: Text(
                            "برگشت",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 30.r,
                                color: Colors.white),
                          )))),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _container(String title, String about) {
  return Container(
    width: 400.r,
    // height: 200.r,
    margin: EdgeInsets.all(10.r),
    padding: EdgeInsets.all(5.r),
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
          blurRadius: 10.r,
          spreadRadius: 2.r,
        ),
      ],
      borderRadius: BorderRadius.circular(20.r),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 22.r,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        // SizedBox(height: 10.r),
        Text(
          about,
          style: TextStyle(
            fontSize: 18.r,
            color: Colors.white.withOpacity(0.9),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
