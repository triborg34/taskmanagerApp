import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MySettingRows extends StatelessWidget {
  String title;
  IconData iconData;
  Function() onpress;

  MySettingRows(
      {required this.title, required this.iconData, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green, width: 5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
            Icon(
              iconData,
              color: Colors.white,
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
