import 'package:flutter/material.dart';
import 'package:bmi_calculator/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      home: HomePage(),
    );
  }
}
