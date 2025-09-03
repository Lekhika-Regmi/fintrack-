import 'package:flutter/material.dart';

class AppConstants {
  // Colors
  static const Color seedColor = Color(0xFF54afe7);
  static const Color primaryColor = seedColor;
  static const Color backgroundColor = Color(0xFFF8FBFF);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF54afe7), Color.fromARGB(255, 125, 210, 250)],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color.fromARGB(255, 236, 241, 248), Color.fromARGB(255, 219, 232, 248)],
  );

  // Spacing
  static const double paddingM = 16.0;
  static const double paddingL = 24.0;

  // Border Radius
  static const double radiusM = 25.0;

  // Button Styles
  static ButtonStyle get primaryButtonStyle => ElevatedButton.styleFrom(
    backgroundColor: primaryColor,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radiusM)),
    padding: const EdgeInsets.symmetric(vertical: paddingM),
  );

  static ButtonStyle get textButtonStyle =>
      TextButton.styleFrom(foregroundColor: primaryColor);

  // Input Decoration
  static InputDecoration getInputDecoration(String labelText) {
    return InputDecoration(
      labelText: labelText,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusM),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusM),
        borderSide: BorderSide(color: Colors.grey.shade300),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(radiusM),
        borderSide: const BorderSide(color: primaryColor, width: 2),
      ),
    );
  }
}
