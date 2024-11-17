import 'package:flutter/material.dart';

class helppage extends StatelessWidget {
  const helppage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(226, 208, 246, 255),
      // appBar: AppBar(
      //     title: Text("Help"),
      //     backgroundColor: Color.fromARGB(255, 61, 214, 235)),
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(
                    width: 40,
                  ),
                  Container(
                    child: Icon(
                      Icons.menu,
                    ),
                  )
                ],
              )
              // Container(
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.pushNamed(context, '/home');
              //     },
              //     child: Icon(
              //       Icons.search,
              //     ),
              //   ),
              // ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            width: 400,
            height: 700,
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    "assets/mansori.jpg",
                    width: 350,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "How You \n     Fell World?",
                  style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "It looks like a banana. If you feel  \nlike you need a banana in the world, \n you should adopt the banana \n lifestyle",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                    child: Text(
                  "Read More About Us",
                  style: TextStyle(color: Colors.cyan),
                )),
                Center(
                  child: GestureDetector(
                    child: Icon(Icons.expand_more_sharp, color: Colors.cyan),
                    onTap: () {},
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 50),
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
                  "Back",
                  style: TextStyle(fontStyle: FontStyle.italic, fontSize: 20),
                ),
              )),
        ],
      ),
    );
  }
}
