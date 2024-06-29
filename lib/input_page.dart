import 'package:flutter/material.dart';
import 'package:my_bmi_calc/types/input_page_types.dart';
import 'enums/input_page_enums.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color secondaryCardColor = Color(0xFF272B4E);
  Color primaryCardColor = Color(0xFF14193B);
  final genders = Genders();

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
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      backgroundColor: secondaryCardColor,
                      cardTitle: genders.male,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      backgroundColor: secondaryCardColor,
                      cardTitle: genders.female,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardTitle: 'HEIGHT',
                      backgroundColor: primaryCardColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ReusableCard(
                      cardTitle: 'Weight',
                      backgroundColor: primaryCardColor,
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      cardTitle: 'AGE',
                      backgroundColor: primaryCardColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.backgroundColor,
    required this.cardTitle,
  });

  final Color backgroundColor;
  final String cardTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: TextButton(
        child: Text(
          cardTitle,
        ),
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
//
// class HeightCard extends StatelessWidget {
//   const HeightCard({
//     super.key,
//     required this.secAndThirdRowColor,
//   });
//
//   final Color secAndThirdRowColor;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2),
//       child: TextButton(
//         child: Text(
//           'HEIGHT',
//         ),
//         style: TextButton.styleFrom(
//           backgroundColor: secAndThirdRowColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }
//
// class GenderCard extends StatelessWidget {
//   const GenderCard({
//     super.key,
//     required this.backgroundColor,
//     required this.gender,
//   });
//
//   final Color backgroundColor;
//   final String gender;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(2),
//       child: TextButton(
//         child: Text(
//           gender,
//           // style: TextStyle(color: Colors.white),
//         ),
//         style: TextButton.styleFrom(
//           backgroundColor: backgroundColor,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(5),
//           ),
//         ),
//         onPressed: () {},
//       ),
//     );
//   }
// }
