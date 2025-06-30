import 'dart:math';

extension DoubleHelper on double {
  double minMax(double value) {
    double min = this;
    double max = value;
    final random = Random();

    double randomNumber = (random.nextDouble() * (max - min)) + min;
    return randomNumber;
  }
}
