import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/reusable_card.dart';
import '../widgets/icon_content.dart';
import '../constants.dart';
import '../widgets/bottom_button.dart';
import '../widgets/number_card.dart';

enum Gender {
  male,
  female,
  none,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender activated = Gender.none;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ReusableCard(
                  color: activated == Gender.male
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  onTap: () {
                    setState(() {
                      activated = Gender.male;
                    });
                  },
                  child: IconContent(
                    label: 'MALE',
                    icon: FontAwesomeIcons.mars,
                    iconColor:
                        activated == Gender.male ? Colors.blue : Colors.white,
                  ),
                ),
                ReusableCard(
                  color: activated == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                  onTap: () {
                    setState(() {
                      activated = Gender.female;
                    });
                  },
                  child: IconContent(
                    label: 'FEMALE',
                    icon: FontAwesomeIcons.venus,
                    iconColor:
                        activated == Gender.female ? Colors.pink : Colors.white,
                  ),
                ),
              ],
            ),
          ),
          ReusableCard(
            color: kActiveCardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('HEIGHT', style: kLabelTextStyle),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(height.toString(), style: kNumberTextStyle),
                    const Text('cm', style: kLabelTextStyle),
                  ],
                ),
                Slider(
                  value: height.toDouble(),
                  min: 50,
                  max: 230,
                  onChanged: (newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                NumberCard(
                  number: weight,
                  label: 'WEIGHT',
                  minusFunction: () {
                    setState(() => weight--);
                  },
                  plusFunction: () {
                    setState(() => weight++);
                  },
                ),
                NumberCard(
                  number: age,
                  label: 'AGE',
                  minusFunction: () {
                    setState(() => age--);
                  },
                  plusFunction: () {
                    setState(() => age++);
                  },
                ),
              ],
            ),
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              Navigator.pushNamed(
                context,
                '/results',
                arguments: BMICalculator(
                  height: height,
                  weight: weight,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
