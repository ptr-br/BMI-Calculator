import 'package:flutter/material.dart';
import 'Screens/input_page.dart';
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Color(0xFFB0B0B0),
          accentColor: Color(0xFFB0B0B0),
          textTheme: TextTheme(body1: TextStyle(color: Colors.black)),
          scaffoldBackgroundColor: Color(0xFFF2F2F2)),
      home: InputPage(),
    );
  }
}

