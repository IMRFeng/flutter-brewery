import 'package:appbrewery/bmi/screens/bmi_page.dart';
import 'package:appbrewery/bmi/screens/results_page.dart';
import 'package:flutter/material.dart';

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => BMIPage(),
        '/results': (context) => BMIResult(),
      },
    );
  }
}
