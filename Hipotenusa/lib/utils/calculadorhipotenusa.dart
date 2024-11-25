import 'dart:math';

class TriangleCalculator {
  static double calculateHypotenuse(double sideA, double sideB) {
    if (sideA <= 0 || sideB <= 0) {
      throw ArgumentError("Los lados deben ser mayores a 0.");
    }
    return sqrt(pow(sideA, 2) + pow(sideB, 2));
  }
}
