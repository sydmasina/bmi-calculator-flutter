import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          color: Color(0xFF0B0D22),
          shadowColor: Colors.black,
          elevation: 1,
        ),
        primaryColor: Color(0xFF121439),
        scaffoldBackgroundColor: Color(0xFF121439),
      ),
      home: InputPage(),
    );
  }
}
