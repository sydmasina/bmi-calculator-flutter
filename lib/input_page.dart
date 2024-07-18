import 'dart:math';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calc/constants/bmi_constants.dart';
import 'package:my_bmi_calc/shared/bottom_button.dart';
import 'package:my_bmi_calc/shared/results_page.dart';
import 'package:my_bmi_calc/types/BMI_type.dart';
import 'package:my_bmi_calc/types/input_page_types.dart';
import 'constants/style_constants.dart';
import 'shared/gender_card.dart';
import 'shared/increment_controller.dart';
import 'shared/measurement_card.dart';
import 'shared/resuable_card.dart';
import 'shared/measurement_scale_unit_card.dart';

final genders = Genders();

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 129;
  int weight = 60;
  int age = 18;
  String gender = genders.male;
  double bmiResult = 0;

  void incrementWeight() {
    setState(() {
      weight += 1;
    });
  }

  void decrementWeight() {
    setState(() {
      weight -= 1;
    });
  }

  void incrementAge() {
    setState(() {
      age += 1;
    });
  }

  void decrementAge() {
    setState(() {
      age -= 1;
    });
  }

  void setActiveGender(String genderToSet) {
    setState(() {
      gender = genderToSet;
    });
  }

  BmiType calculateBmi() {
    bmiResult = weight / (pow((height / 100), 2));
    late BmiType resultBmiType;

    if (bmiResult >= 40) {
      resultBmiType = bmiTypeList[5];
      return resultBmiType;
    }

    for (var bmiType in bmiTypeList) {
      if (bmiResult >= bmiType.bmiRange.min &&
          bmiResult <= bmiType.bmiRange.max) {
        resultBmiType = bmiType;
        break;
      }
    }

    return resultBmiType;
  }

  void onRedirect() {
    Future(() {
      Navigator.pushNamed(context, '/results');
    });
  }

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
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kSecondaryCardColor,
                    cardChild: GenderCard(
                      gender: genders.male,
                      genderIconData: FontAwesomeIcons.mars,
                      isActive: gender == genders.male,
                      setGenderCallbackFn: setActiveGender,
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kSecondaryCardColor,
                    cardChild: GenderCard(
                      gender: genders.female,
                      genderIconData: FontAwesomeIcons.venus,
                      isActive: gender == genders.female,
                      setGenderCallbackFn: setActiveGender,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kPrimaryCardColor,
                    cardChild: MeasurementCard(
                      cardTitle: 'HEIGHT',
                      measurementScale: MeasurementScaleUnitCard(
                        measurementValue: height.toInt(),
                        scaleUnit: 'cm',
                      ),
                      measurementController: SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          trackHeight: 1,
                        ),
                        child: Slider(
                          value: height,
                          min: 100,
                          max: 200,
                          activeColor: kBrandPrimaryColor,
                          inactiveColor: Colors.grey,
                          onChanged: (double setValue) {
                            setState(() {
                              height = setValue;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kPrimaryCardColor,
                    cardChild: MeasurementCard(
                      cardTitle: 'WEIGHT',
                      measurementScale: MeasurementScaleUnitCard(
                        measurementValue: weight,
                        scaleUnit: 'kg',
                      ),
                      measurementController: AddOrMinusController(
                        decrementCallFn: decrementWeight,
                        incrementCallbackFn: incrementWeight,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kPrimaryCardColor,
                    cardChild: MeasurementCard(
                      cardTitle: 'AGE',
                      measurementScale: MeasurementScaleUnitCard(
                        measurementValue: age,
                        scaleUnit: 'yrs',
                      ),
                      measurementController: AddOrMinusController(
                        decrementCallFn: decrementAge,
                        incrementCallbackFn: incrementAge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: BottomButton(
                      btnTitle: 'CALCULATE YOUR BMI',
                      onTapFn: () {
                        final BmiType bmiTypeResult = calculateBmi();
                        if (bmiResult == null) {
                          return;
                        }
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ResultsPage(bmiResult, bmiTypeResult)));
                      }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
