import 'package:flutter/material.dart';

extension ScreenSize on BuildContext {
  get screenWith => MediaQuery.of(this).size.width;
  get screenHeight => MediaQuery.of(this).size.height;
}

List<Color> colors = [
  Colors.green,
  Colors.greenAccent,
  Colors.lightGreen,
  Colors.lightGreenAccent,
  Colors.green.shade300
];

List<Color> colorswithopacity = [
  Colors.green.withOpacity(0.2),
  Colors.greenAccent.withOpacity(0.2),
  Colors.lightGreen.withOpacity(0.2),
  Colors.lightGreenAccent.withOpacity(0.2),
  Colors.green.shade300.withOpacity(0.2)
];

List<BoxShadow> boxshadow = [
  BoxShadow(
      offset: Offset(0, 0),
      blurRadius: 10,
      spreadRadius: 1,
      color: Color.fromARGB(255, 207, 206, 206))
];
