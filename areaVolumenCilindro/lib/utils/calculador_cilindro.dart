import 'dart:math';

class cilindroCalculador {
  static double calculateBaseAreaByRadius(double radius) {
    if (radius <= 0) throw ArgumentError("El radio debe ser positivo.");
    return pi * pow(radius, 2);
  }

  static double calculateBaseAreaByDiameter(double diameter) {
    if (diameter <= 0) throw ArgumentError("El diámetro debe ser positivo.");
    double radius = diameter / 2;
    return pi * pow(radius, 2);
  }

  static double calculateVolume(double baseArea, double height) {
    if (height <= 0) throw ArgumentError("La altura debe ser positiva.");
    return baseArea * height;
  }
}
