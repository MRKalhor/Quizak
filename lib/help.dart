import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'savefail.dart';
import 'result.dart';
import 'quiz.dart';
import 'wellcome.dart';

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
            '/': (context) => HelpPage(),
            '/help': (context) => HelpPage(),
            '/home': (context) => WellcomePage(),
            '/quiz': (context) => QuizPage(),
            '/result': (context) => Resultpage(),
            '/savefail': (context) => SaveFail(),
          },
        );
      },
    );
  }
}

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
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
          color: Colors.black,
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
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
