import 'package:flutter/material.dart';

const List<Color> colorList = [
  Colors.black87,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.teal,
  Colors.brown,
  Color.fromARGB(255, 255, 0, 0)
];

class AppTheme {
  final int colorIndex;
  AppTheme({required this.colorIndex});
  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: colorList[colorIndex],
    );
  }
}
