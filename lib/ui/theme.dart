import 'package:flutter/material.dart';

const Color blueishClr = Color(0xFF4e5ae8);
const Color yellowClr = Color(0xFFFFb746);
const Color pinkClr = Color(0xFFFF4667);
const Color white = Colors.white;
const primaryClr = blueishClr;
const Color darkGryClr = Color(0xFF121212);
const Color darkHeaderClr = Color(0xFF424242);

class Themes {
  static final light =
      ThemeData(primaryColor: primaryClr, brightness: Brightness.light);
  static final dark =
      ThemeData(primaryColor: darkGryClr, brightness: Brightness.dark);
}
