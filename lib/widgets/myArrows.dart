import 'package:flutter/material.dart';

class MyArrows extends StatelessWidget {
  Function() onpress = () {};
  IconData iconData;

  MyArrows({required this.onpress, required this.iconData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: CircleAvatar(
          radius: 16,
          backgroundColor: Colors.white,
          child: Center(
              child: Icon(
            iconData,
            color: Colors.green,
            size: 26,
          ))),
    );
  }
}
