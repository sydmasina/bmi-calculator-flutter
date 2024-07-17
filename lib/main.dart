import 'package:flutter/material.dart';
import 'package:my_bmi_calc/constants/style_constants.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(
            color: kScaffoldBackgroundColor,
            shadowColor: Colors.black,
            elevation: 0,
          ),
          scaffoldBackgroundColor: kScaffoldBackgroundColor,
          textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.zero),
              ),
            ),
          )),
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}
