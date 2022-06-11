import 'package:flutter/material.dart';

import 'pages/input_page.dart';
import 'pages/results_page.dart';

void main() {
  runApp(const BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const blackPurple = Color(0xff0a0e21);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: blackPurple,
        sliderTheme: SliderTheme.of(context).copyWith(
          activeTrackColor: const Color(0xffeb1555),
          inactiveTrackColor: const Color(0xff8d8e98),
          thumbColor: const Color(0xffeb1555),
          overlayColor: const Color(0x50eb1555),
          overlayShape: const RoundSliderOverlayShape(
            overlayRadius: 30,
          ),
          thumbShape: const RoundSliderThumbShape(
            enabledThumbRadius: 15.0,
          ),
        ),
        colorScheme: ThemeData.dark().colorScheme.copyWith(
              primary: blackPurple,
              //secondary: Colors.purple,
            ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const InputPage(),
        '/results': (context) => const ResultsPage(),
      },
    );
  }
}
