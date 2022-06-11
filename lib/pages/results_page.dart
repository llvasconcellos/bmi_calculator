import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/bottom_button.dart';
import '../bmi_calculator.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bmi = ModalRoute.of(context)!.settings.arguments as BMICalculator;
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.all(15),
              child: const Text(
                'Your Result',
                style: kTitleTextStyle,
              ),
            ),
          ),
          ReusableCard(
            flex: 6,
            color: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  bmi.result.toUpperCase(),
                  style: kResultTextStyle,
                ),
                Text(
                  bmi.bmi,
                  style: kBMITextStyle,
                ),
                Text(
                  bmi.interpretation,
                  textAlign: TextAlign.center,
                  style: kBodyTextStyle,
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'RE-CALCULATE',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
