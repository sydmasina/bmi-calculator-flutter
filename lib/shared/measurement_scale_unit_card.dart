import 'package:flutter/material.dart';
import 'package:my_bmi_calc/constants/style_constants.dart';

class MeasurementScaleUnitCard extends StatelessWidget {
  const MeasurementScaleUnitCard({
    super.key,
    required this.measurementValue,
    required this.scaleUnit,
  });

  final int measurementValue;
  final String scaleUnit;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          '$measurementValue',
          style: kMeasurementNumberStyle,
        ),
        Text(
          scaleUnit,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
