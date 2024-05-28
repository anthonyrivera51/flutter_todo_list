import 'package:flutter/material.dart';
import '../core/app_export.dart';

class CustomButtonStyles {
  static ButtonStyle get fillPrimaryTL2 => ElevatedButton.styleFrom(
    backgroundColor: Colors.blue.shade200,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2),
    ),
  );
  static ButtonStyle get fillWhiteA => ElevatedButton.styleFrom(
    backgroundColor: Colors.white70,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
  );
  static ButtonStyle get none => ButtonStyle(
    backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
    elevation: MaterialStateProperty.all<double>(0),
  );
}