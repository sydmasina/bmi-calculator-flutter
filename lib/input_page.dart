import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calc/types/input_page_types.dart';
import 'constants/style_constants.dart';
import 'shared/gender_card.dart';
import 'shared/increment_controller.dart';
import 'shared/measurement_card.dart';
import 'shared/resuable_card.dart';

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
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kPrimaryCardColor,
                    cardChild: MeasurementCard(
                      cardTitle: 'HEIGHT',
                      measurementCount: height.toInt(),
                      measurementController: Slider(
                        value: height,
                        min: 100,
                        max: 200,
                        activeColor: kBrandPrimaryColor,
                        inactiveColor: kSecondaryCardColor,
                        onChanged: (double setValue) {
                          setState(() {
                            height = setValue;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: ReusableCard(
                    backgroundColor: kPrimaryCardColor,
                    cardChild: MeasurementCard(
                      cardTitle: 'WEIGHT',
                      measurementCount: weight,
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
                      measurementCount: age,
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
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Color(0xffFF0067),
                  height: kBottomContainerHeight,
                  child: TextButton(
                    child: Text('CALCULATE YOUR BMI'),
                    onPressed: () {},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
