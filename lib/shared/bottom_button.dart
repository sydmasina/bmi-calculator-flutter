import 'package:flutter/material.dart';
import 'package:my_bmi_calc/constants/style_constants.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.btnTitle, required this.onTapFn});

  final VoidCallback onTapFn;
  final String btnTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFn,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10.0),
        color: kExecuteBtnColor,
        child: Center(
          child: Text(
            btnTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
