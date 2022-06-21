import 'package:flutter/material.dart';
import 'modules/bmi/Bmi_screen.dart';
import 'modules/bmi_result//bmi_result_screen.dart';

void main() {
  runApp(MyApp());
}

// الويدجت ليه نوعين بستخدم منهم واحد وهم اللي بينوبوا عنه مش بعرف ويدجت
//StatelessWidget
//stateFulWidget

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiScreen(),
    );
  }
}