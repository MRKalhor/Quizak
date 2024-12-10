import "package:flutter/material.dart";
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WellcomePage extends StatelessWidget {
  const WellcomePage({super.key});

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
          ])),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60.h,
                ),
                Flexible(
                  child: Image.asset(
                    "assets/Artboard 1@3x.png",
                    width: 300.w,
                    height: 200.h,
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100.h,
                  ),
                ),
                Text(
                  "خوش اومدید به کویزک",
                  style: TextStyle(fontSize: 22.r, color: Colors.white),
                ),
                Expanded(
                  child: SizedBox(
                    height: 100.h,
                  ),
                ),
                Flexible(
                  child: Container(
                    decoration: ShapeDecoration(
                        shape: StadiumBorder(),
                        gradient: LinearGradient(colors: const [
                          Color(0xFF4E65FF), // آبی روشن
                          Color(0xFF8F55FF), // بنفش
                          Color(0xFF6A3BFF),
                        ])),
                    child: SizedBox(
                        height: 60.h,
                        width: 300.w,
                        child: MaterialButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/quiz');
                            },
                            child: Text(
                              "شروع",
                              style: TextStyle(
                                  fontStyle: FontStyle.normal,
                                  fontSize: 30.r,
                                  color: Colors.white),
                            ))),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Flexible(
                  child: SizedBox(
                      height: 60.h,
                      width: 300.w,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/help');
                        },
                        style: ButtonStyle(
                            backgroundColor:
                                WidgetStateProperty.all(Colors.white),
                            shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        child: Text(
                          "راهنما ",
                          style: TextStyle(
                              fontStyle: FontStyle.normal, fontSize: 30.r),
                        ),
                      )),
                ),
                Expanded(
                    child: SizedBox(
                  height: 20.h,
                ))
              ],
            ),
          ),
        ));
  }
}

Widget build(BuildContext context) {
  return ScreenUtilInit(
    enableScaleWH: () => true,
    enableScaleText: () => false,
    //...
  );
}
