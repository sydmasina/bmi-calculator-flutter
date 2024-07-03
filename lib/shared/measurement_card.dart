import 'package:flutter/material.dart';
import 'package:my_bmi_calc/constants/style_constants.dart';

class MeasurementCard extends StatelessWidget {
  const MeasurementCard(
      {super.key,
      required this.cardTitle,
      required this.measurementScale,
      required this.measurementController});

  final String cardTitle;
  final Widget measurementScale;
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
        measurementScale,
        measurementController
      ],
    );
  }
}
