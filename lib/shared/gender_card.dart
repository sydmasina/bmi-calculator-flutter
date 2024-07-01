import 'package:flutter/material.dart';
import '../constants/style_constants.dart';

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
        backgroundColor: WidgetStateProperty.all<Color>(kSecondaryCardColor),
      );
    }
    return ButtonStyle(
      foregroundColor: WidgetStateProperty.all<Color>(Colors.grey),
      backgroundColor: WidgetStateProperty.all<Color>(kInactiveColor),
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
            style: kLabelTextStyle,
          ),
        ],
      ),
    );
  }
}
