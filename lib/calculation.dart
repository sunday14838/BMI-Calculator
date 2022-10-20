import 'dart:math';

class CalculationBrain {
  CalculationBrain({required this.weight, required this.height});

  final int height;
  final int weight;

  // calculator as a class method returning bmi
  // bmi is a variable scope within the method
  // bmi can't be accessed from other methods
  double calculator() {
    double bmi = weight / pow(height / 100, 2);
    return bmi.toDouble();
  }

  // Here we make use of values returned from calculator method
  // parse the returned value from calculator method to
  // a variable  bmiFromCalculator declared a double
  String resultText() {
    double bmiFromCalculator = calculator();
    if (bmiFromCalculator >= 20.0 && bmiFromCalculator <= 39.99) {
      return 'normal';
    } else if (bmiFromCalculator > 40) {
      return 'overweigh';
      // pass a value condition on this else block as else-if
      // bu putting a limit on -normal- condition on line 22
    } else if (bmiFromCalculator < 19.9) {
      return 'low';
    } else {
      return 'error finding answer';
    }
  }

  // Also, here we make use of values returned from calculator method
  // parse the returned value from calculator method to
  // a variable  bmiFromCalculator declared a double
  String interpretationText() {
    double bmiFromCalculator = calculator();
    if (bmiFromCalculator >= 20 && bmiFromCalculator <= 39.99) {
      return 'You have a good body mass. keep up the hygiene';
    } else if (bmiFromCalculator > 40) {
      return 'Guy, you are too fat and big. Try to reduce your weight';
    }else if (bmiFromCalculator < 19.9) {
      return 'Please eat more';
    }else {
      return 'couldnt determine your weight';
    }
  }
}
