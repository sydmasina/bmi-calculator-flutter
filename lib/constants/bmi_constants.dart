library bmi_constants;

import '../types/BMI_type.dart';
import '../types/range.dart';

List bmiTypeList = [
  BmiType(
      'Underweight',
      "You are underweight, which may indicate nutritional deficiencies; consider consulting a healthcare provider for guidance.",
      Range(0, 18.5)),
  BmiType(
      'Normal weight',
      "You have a normal weight, which is generally healthy; maintain it with a balanced diet and regular exercise.",
      Range(18.5, 24.9)),
  BmiType(
      'Overweight',
      "You are overweight, increasing your risk of health issues; consider lifestyle changes to manage your weight.",
      Range(25, 29.9)),
  BmiType(
      'Obesity Class 1',
      "You have class 1 obesity, raising your health risks; consult a healthcare provider for weight management advice.",
      Range(30, 34.9)),
];
