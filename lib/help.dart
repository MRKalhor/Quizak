import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _container(
              "هدف بازی", "در این بازی شما باید کلمات را به درستی حدس بزنید"),
          _container("نحوه بازی", "با کلیک روی حروف، کلمه مورد نظر را بسازید"),
          _container("امتیازات", "با هر حدس درست ۱۰ امتیاز دریافت می‌کنید"),
          _container(
              "راهنمایی", "از راهنمایی‌های موجود برای حدس کلمات استفاده کنید"),

          // Container(
          //   width: double.infinity,
          //   height: 934,
          //   color: Colors.lightBlueAccent,
          //   child: Column(
          //     children: [
          //       SizedBox(height: 50),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Column(
          //             children: [
          //               SizedBox(
          //                 width: 40,
          //               ),
          //               Container(
          //                   // child: Icon(
          //                   //   Icons.menu,
          //                   // ),
          //                   )
          //             ],
          //           )
          //           // Container(
          //           //   child: GestureDetector(
          //           //     onTap: () {
          //           //       Navigator.pushNamed(context, '/home');
          //           //     },
          //           //     child: Icon(
          //           //       Icons.search,
          //           //     ),
          //           //   ),
          //           // ),
          //         ],
          //       ),
          //       SizedBox(
          //         height: 50,
          //       ),
          //       Container(
          //         decoration: BoxDecoration(
          //           borderRadius: BorderRadius.circular(20),
          //           color: Colors.white,
          //         ),
          //         width: 400,
          //         height: 700,
          //         child: Column(
          //           children: [
          //             SizedBox(
          //               height: 50,
          //             ),
          //             ClipRRect(
          //               borderRadius: BorderRadius.circular(20),
          //               child: Image.asset(
          //                 "assets/mansori.jpg",
          //                 width: 350,
          //               ),
          //             ),
          //             SizedBox(
          //               height: 50,
          //             ),
          //             Text(
          //               "How You \n     Fell World?",
          //               style: TextStyle(
          //                   fontSize: 45, fontWeight: FontWeight.bold),
          //             ),
          //             SizedBox(
          //               height: 50,
          //             ),
          //             Text(
          //               "It looks like a banana. If you feel  \nlike you need a banana in the world, \n you should adopt the banana \n lifestyle",
          //               style: TextStyle(
          //                   fontSize: 20, fontWeight: FontWeight.normal),
          //             ),
          //             SizedBox(
          //               height: 50,
          //             ),
          //             Center(
          //                 child: Text(
          //               "Read More About Us",
          //               style: TextStyle(color: Colors.cyan),
          //             )),
          //             Center(
          //               child: GestureDetector(
          //                 child:
          //                     Icon(Icons.expand_more_sharp, color: Colors.cyan),
          //                 onTap: () {},
          //               ),
          //             )
          //           ],
          //         ),
          //       ),
          //       SizedBox(height: 50),
          //       SizedBox(
          //           height: 60,
          //           width: 350,
          //           child: ElevatedButton(
          //             onPressed: () {
          //               Navigator.pushNamed(context, '/home');
          //             },
          //             style: ButtonStyle(
          //                 backgroundColor:
          //                     WidgetStateProperty.all(Colors.white),
          //                 shape: WidgetStateProperty.all(RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(20)))),
          //             child: Text(
          //               "Back",
          //               style: TextStyle(
          //                   fontStyle: FontStyle.italic, fontSize: 20),
          //             ),
          //           )),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget _container(String title, String about) {
  return Container(
    width: 300,
    height: 150,
    margin: const EdgeInsets.all(20),
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
            fontSize: 18,
            color: Colors.white.withOpacity(0.9),
          ),
        ),
      ],
    ),
  );
}
