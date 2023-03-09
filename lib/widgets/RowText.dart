import 'package:flutter/material.dart';
import 'package:taskmannager/utils/maths.dart';

// ignore: must_be_immutable
class RowTexts extends StatelessWidget {
  String name;
  RowTexts({required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        
        Text(
          name,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
