import 'dart:math';

class BMICalculator{
  final int height;
  final int weight;

  late double _bmi;
  String get bmi => _bmi.toStringAsFixed(1);

  late String _result;
  String get result => _result;

  late String _interpretation;
  String get interpretation => _interpretation;

  BMICalculator({required this.height, required this.weight}) {
    _bmi = weight / (pow((height / 100), 2));
    if (_bmi >= 25) {
      _result = 'Overweight';
      _interpretation = 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      _result = 'Normal';
      _interpretation = 'You have a normal body weight. Good job!';
    } else {
      _result = 'Underweight';
      _interpretation = 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}