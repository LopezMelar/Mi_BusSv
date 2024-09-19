import 'package:flutter/material.dart';

class AppTheme {
  // Define tus colores aquí
  static const Color primaryColor = Colors.purple;
  static const Color textColor = Color(0xFFBDBDBD);

  static TextStyle get
  textFieldStyle {
    return TextStyle(
      color: textColor,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    );
  }

// Puedes agregar más estilos según lo necesites
}
