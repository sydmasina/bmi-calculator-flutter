import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
            color: Color(0xFF121439), shadowColor: Colors.black, elevation: 1),
        primaryColor: Color(0xFF121439),
        scaffoldBackgroundColor: Color(0xFF121439),
      ),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          // style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        // backgroundColor: HexColor('#11173A'),
      ),
      body: Center(
        child: Text('Body Text'),
      ),
      // Padding(
      //   padding: const EdgeInsets.all(12),
      //   child: Column(
      //     children: [
      //       Expanded(
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(2),
      //                 child: TextButton(
      //                   child: Text(
      //                     'MALE',
      //                     // style: TextStyle(color: Colors.white),
      //                   ),
      //                   style: TextButton.styleFrom(
      //                     // backgroundColor: HexColor('#282A4D'),
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(5),
      //                     ),
      //                   ),
      //                   onPressed: () {},
      //                   // style: ButtonStyle().backgroundColor(Colors.white),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(2),
      //                 child: TextButton(
      //                   child: Text(
      //                     'FEMALE',
      //                     // style: TextStyle(color: Colors.white),
      //                   ),
      //                   style: TextButton.styleFrom(
      //                     // backgroundColor: HexColor('#282A4D'),
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(5),
      //                     ),
      //                   ),
      //                   onPressed: () {},
      //                   // style: ButtonStyle().backgroundColor(Colors.white),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 12,
      //       ),
      //       Expanded(
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(2),
      //                 child: TextButton(
      //                   child: Text(
      //                     'HEIGHT',
      //                     // style: TextStyle(color: Colors.white),
      //                   ),
      //                   style: TextButton.styleFrom(
      //                     // backgroundColor: HexColor('#14193B'),
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(5),
      //                     ),
      //                   ),
      //                   onPressed: () {},
      //                   // style: ButtonStyle().backgroundColor(Colors.white),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //       SizedBox(
      //         height: 12,
      //       ),
      //       Expanded(
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.stretch,
      //           children: [
      //             Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(2),
      //                 child: TextButton(
      //                   child: Text(
      //                     'WEIGHT',
      //                     // style: TextStyle(color: Colors.white),
      //                   ),
      //                   style: TextButton.styleFrom(
      //                     // backgroundColor: HexColor('#14193B'),
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(5),
      //                     ),
      //                   ),
      //                   onPressed: () {},
      //                   // style: ButtonStyle().backgroundColor(Colors.white),
      //                 ),
      //               ),
      //             ),
      //             Expanded(
      //               child: Padding(
      //                 padding: const EdgeInsets.all(2),
      //                 child: TextButton(
      //                   child: Text(
      //                     'AGE',
      //                     // style: TextStyle(color: Colors.white),
      //                   ),
      //                   style: TextButton.styleFrom(
      //                     // backgroundColor: HexColor('#14193B'),
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(5),
      //                     ),
      //                   ),
      //                   onPressed: () {},
      //                   // style: ButtonStyle().backgroundColor(Colors.white),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
      // backgroundColor: HexColor('#11173A'),
    );
  }
}
