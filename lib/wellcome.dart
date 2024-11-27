import "package:flutter/material.dart";

// ignore: camel_case_types
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
                  height: 60,
                ),
                Image.asset(
                  "assets/Artboard 1@3x.png",
                  width: 350,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "خوش اومدید به کویزک",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                SizedBox(
                  height: 80,
                ),
                // Image.asset(
                //   "assets/logo_web.png",
                //   width: 200,
                // ),
                SizedBox(
                  height: 100,
                ),
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
                            Navigator.pushNamed(context, '/quiz');
                          },
                          child: Text(
                            "شروع",
                            style: TextStyle(
                                fontStyle: FontStyle.normal,
                                fontSize: 30,
                                color: Colors.white),
                          ))),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                    height: 60,
                    width: 350,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/help');
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              WidgetStateProperty.all(Colors.white),
                          shape: WidgetStateProperty.all(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)))),
                      child: Text(
                        "راهنما ",
                        style: TextStyle(
                            fontStyle: FontStyle.normal, fontSize: 30),
                      ),
                    )),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/savefail');
                    },
                    child: Text("SaveFail"))
              ],
            ),
          ),
        ));
  }
}
