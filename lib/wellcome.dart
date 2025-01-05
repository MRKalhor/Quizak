import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'savefail.dart';
import 'result.dart';
import 'help.dart';
import 'quiz.dart';
import 'profile.dart';

void main() async {
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Quizak',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => WellcomePage(),
            '/help': (context) => HelpPage(),
            '/home': (context) => WellcomePage(),
            '/quiz': (context) => QuizPage(),
            '/result': (context) => Resultpage(),
            '/savefail': (context) => SaveFail(),
            '/profile': (context) => ProfilePage(),
          },
        );
      },
    );
  }
}

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WellcomePageState createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      switch (index) {
        case 0:
          Navigator.pushNamed(context, '/home');
          break;
        case 1:
          Navigator.pushNamed(context, '/quiz');
          break;
        case 2:
          Navigator.pushNamed(context, '/help');
          break;
        case 3:
          Navigator.pushNamed(context, '/profile');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Color.fromARGB(190, 0, 238, 255),
              Color.fromARGB(104, 132, 0, 255),
              Color.fromARGB(190, 0, 238, 255),
            ],
          ),
        ),
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
                    gradient: LinearGradient(
                      colors: const [
                        Color(0xFF4E65FF),
                        Color(0xFF8F55FF),
                        Color(0xFF6A3BFF),
                      ],
                    ),
                  ),
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
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
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
                      backgroundColor: WidgetStatePropertyAll(Colors.white),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    child: Text(
                      "راهنما ",
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 30.r,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 20.h,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Questions',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 0, 204, 255),
        onTap: _onItemTapped,
      ),
    );
  }
}
