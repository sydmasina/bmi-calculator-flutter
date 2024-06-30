import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_bmi_calc/types/input_page_types.dart';

const bottomContainerHeight = 80.0;
const Color secondaryCardColor = Color(0xFF272B4E);
const Color primaryCardColor = Color(0xFF14193B);
const Color brandPrimaryColor = Color(0xffFF0067);
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
                    backgroundColor: secondaryCardColor,
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
                    backgroundColor: secondaryCardColor,
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
                    backgroundColor: primaryCardColor,
                    cardChild: MeasurementCard(
                      cardTitle: 'HEIGHT',
                      measurementCount: height.toInt(),
                      measurementController: Slider(
                        value: height,
                        min: 100,
                        max: 200,
                        activeColor: brandPrimaryColor,
                        inactiveColor: secondaryCardColor,
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
                    backgroundColor: primaryCardColor,
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
                    backgroundColor: primaryCardColor,
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
                  height: bottomContainerHeight,
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

class AddOrMinusController extends StatelessWidget {
  const AddOrMinusController({
    super.key,
    required this.incrementCallbackFn,
    required this.decrementCallFn,
  });

  final Function incrementCallbackFn;
  final Function decrementCallFn;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            child: Icon(FontAwesomeIcons.minus),
            backgroundColor: secondaryCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 0,
            onPressed: () {
              decrementCallFn();
            },
          ),
          FloatingActionButton(
            child: Icon(FontAwesomeIcons.plus),
            backgroundColor: secondaryCardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 0,
            onPressed: () {
              incrementCallbackFn();
            },
          ),
        ],
      ),
    );
  }
}

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

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.genderIconData,
    required this.gender,
    required this.isActive,
    required this.setGenderCallbackFn,
  });

  final IconData genderIconData;
  final String gender;
  final bool isActive;
  final Function setGenderCallbackFn;

  ButtonStyle setButtonState() {
    if (isActive) {
      return ButtonStyle(
        foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
      );
    }
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(Colors.grey),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        setGenderCallbackFn(gender);
      },
      style: setButtonState(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            genderIconData,
            size: 80,
            weight: 600,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            gender,
          ),
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.backgroundColor,
    required this.cardChild,
  });

  final Color backgroundColor;
  final Widget cardChild;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
