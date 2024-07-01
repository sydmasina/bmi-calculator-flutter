import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/style_constants.dart';

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
            backgroundColor: kSecondaryCardColor,
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
            backgroundColor: kSecondaryCardColor,
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
