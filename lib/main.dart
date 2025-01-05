import 'package:flutter/material.dart';
import 'package:flutter_application_first/forget.dart';
import '/savefail.dart';
import '/result.dart';
import '/help.dart';
import '/quiz.dart';
import '/wellcome.dart';
import 'profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// PUB_HOSTED_URL set user path: https://pub.flutter-io.cn

void main() async {
  // await Hive.initFlutter();
  // await Hive.openBox('mybox');
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
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'First Method',
          // You can use the library anywhere in the app even in theme
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
          ),
          home: WellcomePage(),
          routes: {
            '/help': (context) => HelpPage(),
            '/home': (context) => WellcomePage(),
            '/quiz': (context) => QuizPage(),
            '/result': (context) => Resultpage(),
            '/savefail': (context) => SaveFail(),
            '/profile': (context) => ProfilePage(),
            // '/login': (context) => LoginScreen(),
            '/forge': (context) => ForgetPage(),
          },
        );
      },
    );
  }
}

Widget build(BuildContext context) {
  return ScreenUtilInit(
    enableScaleWH: () => true,
    enableScaleText: () => true,
    //...
  );
}
