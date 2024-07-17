import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_bmi_calc/constants/style_constants.dart';
import 'package:my_bmi_calc/shared/bottom_button.dart';
import 'package:my_bmi_calc/shared/resuable_card.dart';
import 'package:my_bmi_calc/types/BMI_type.dart';

class ResultsPage extends StatelessWidget {
  ResultsPage(this.resultValue, this.bmiType);

  final double resultValue;
  final BmiType bmiType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Your Results',
            style: kLargeHeadingStyle,
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: ReusableCard(
                backgroundColor: kResultCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      bmiType.type,
                      style: kSubTittleStyle,
                    ),
                    Text(
                      double.parse(resultValue.toStringAsFixed(2)).toString(),
                      style: kBmiResultNumberStyle,
                    ),
                    Text(
                      bmiType.description,
                      textAlign: TextAlign.center,
                      style: kResultDescriptionTextStyle,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: BottomButton(
                      btnTitle: 'RE CALCULATE',
                      onTapFn: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
