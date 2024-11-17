import 'package:flutter/material.dart';

class resultpage extends StatelessWidget {
  const resultpage({super.key});

  @override
  Widget build(BuildContext context) {
    var data;
    data = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(data['right'].toString()),
          ],
        ),
      ),
    );
  }
}
