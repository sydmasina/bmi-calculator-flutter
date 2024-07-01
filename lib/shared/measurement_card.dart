import 'package:flutter/material.dart';
import 'package:my_bmi_calc/constants/style_constants.dart';

class MeasurementCard extends StatelessWidget {
  const MeasurementCard(
      {super.key,
      required this.cardTitle,
      required this.measurementCount,
      required this.measurementController});

  final String cardTitle;
  final int measurementCount;
  final Widget measurementController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cardTitle,
          style: kLabelTextStyle,
        ),
        Text(
          '$measurementCount',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.w800,
          ),
        ),
        measurementController
      ],
    );
  }
}
