import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constants.dart';
import 'reusable_card.dart';
import 'round_icon_button.dart';

class NumberCard extends StatefulWidget {
  final int number;
  final String label;
  final VoidCallback minusFunction;
  final VoidCallback plusFunction;

  const NumberCard({
    Key? key,
    required this.number,
    required this.label,
    required this.minusFunction,
    required this.plusFunction,
  }) : super(key: key);

  @override
  State<NumberCard> createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      color: kActiveCardColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(widget.label, style: kLabelTextStyle),
          Text(widget.number.toString(), style: kNumberTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundIconButton(
                icon: FontAwesomeIcons.minus,
                onPressed: widget.minusFunction,
              ),
              const SizedBox(width: 10),
              RoundIconButton(
                icon: FontAwesomeIcons.plus,
                onPressed: widget.plusFunction,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
