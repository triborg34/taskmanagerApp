import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';

class HelloTextWidget extends StatelessWidget {
  const HelloTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          " سلام ، مهتاب",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(
          "${Get.find<TaskAndPRojBox>().taskList.length} کار مانده...",
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
