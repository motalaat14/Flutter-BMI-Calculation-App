import 'dart:math';


class CalculatorBrain {


  double _bmi;

  CalculatorBrain({this.height, this.weight});

  final int height;
  final int weight;

  String CalculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'OVERWEIGHT';
    } else if (_bmi > 18.5) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }


  String getDiscription (){

    if (_bmi >= 25) {
      return 'Amm .. You have a higher than normal weight. Try to exercise more.';
    } else if (_bmi > 18.5) {
      return 'Great .. You are normal body weight. Good job!';
    } else {
      return 'What .. You have a lower than normal body weight. You can eat more.';
    }

  }




}