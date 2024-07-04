import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../custom_widgets/round_icon_button.dart';

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
          RoundIconButton(
            icon: FontAwesomeIcons.minus,
            onPressed: decrementCallFn,
          ),
          RoundIconButton(
            icon: FontAwesomeIcons.plus,
            onPressed: incrementCallbackFn,
          ),
        ],
      ),
    );
  }
}
