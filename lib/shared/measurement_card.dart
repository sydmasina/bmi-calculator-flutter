import 'package:flutter/material.dart';

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
        Text(cardTitle),
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
