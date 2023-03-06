import 'package:flutter/material.dart';

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          " سلام ، عارف",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "0 کار مانده...",
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: Color.fromARGB(255, 105, 105, 105),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
