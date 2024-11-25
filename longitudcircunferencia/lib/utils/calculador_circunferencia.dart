import 'dart:math';

class calcularLonguitudCircunferencia {
  static double calculateByRadius(double radius) {
    if (radius <= 0) throw ArgumentError("El radio debe ser positivo.");
    return 2 * pi * radius;
  }

  static double calculateByDiameter(double diameter) {
    if (diameter <= 0) throw ArgumentError("El diámetro debe ser positivo.");
    return pi * diameter;
  }
}
