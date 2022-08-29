import 'dart:math';

class bmibrain {
  final int height;
  final int weight;
  double _bmi = 0.0;
  bmibrain({this.height, this.weight});
  String Calcluatebmi() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String Result() {
    if (_bmi >= 25.0) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'UnderWeight';
    }
  }

  String brief() {
    if (_bmi >= 25)
      return "Exercise More";
    else if (_bmi > 18.5)
      return 'You Are Fit !';
    else
      return 'Stay healty!';
  }
}
