import 'dart:math';

class Calculator{
  Calculator({this.weight,this.height});

  final height;
  final weight;
  // ignore: non_constant_identifier_names
  double _bmi;

  String calcBMI(){
     _bmi = weight/pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }

  String getResults(){
    if(_bmi>25){
      return 'Overweight';
    }else if (_bmi>=18.5){
      return 'Normal';
    }else{
      return 'Underweight';
    }
  }
  String getInterpretation(){
    if(_bmi>=25){
      return 'Your BMI is elevated. Pay attention to your nutrition and exercise regularly. In this way you can minimize the risk of possible concomitant diseases.';
    }else if (_bmi>=18.5){
      return 'Great! Your weight is healthy. With a balanced nutrition and regular exercise this will remain so in the long term.';
    }else{
      return 'Your BMI is very low. Try to gain some weight to stay healthy and fit in the long term.';
    }
  }
}