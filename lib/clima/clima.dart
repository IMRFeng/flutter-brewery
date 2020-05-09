import 'package:appbrewery/clima/screens/loading_screen.dart';
import 'package:flutter/material.dart';

class Clima extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
