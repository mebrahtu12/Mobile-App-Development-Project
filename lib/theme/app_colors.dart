import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors
  static const Color primaryGreen = Color(0xFF2E7D32); // Green 800
  static const Color primaryLightGreen = Color(0xFFC8E6C9); // Green 100
  static const Color secondaryGreen = Color(0xFF4CAF50); // Green 500

  // Background Colors
  static const Color scaffoldBackground = Color(0xFFF1F8E9); // Light Green 50
  static const Color cardBackground = Colors.white;

  // Text Colors
  static const Color textPrimary = Color(0xFF1B5E20); // Green 900
  static const Color textSecondary = Color(0xFF388E3C); // Green 700
  static const Color textWhite = Colors.white;

  // Accents & Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF66BB6A), Color.fromARGB(255, 48, 123, 52)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const List<BoxShadow> softShadow = [
    BoxShadow(color: Colors.black12, blurRadius: 10, offset: Offset(0, 4)),
  ];
}
