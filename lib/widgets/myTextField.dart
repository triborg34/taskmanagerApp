// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';

class MyTextField extends StatelessWidget {
  String hint;
  TextEditingController controller;

  MyTextField({required this.hint, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: Colors.green,
      cursorHeight: 25,
      autocorrect: true,
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey),
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        
          label: Align(
        alignment: Alignment.topRight,
        child: Text(
          textDirection: TextDirection.rtl,
          hint,
          style: TextStyle(color: Colors.grey),
        ),
      )),
    );
  }
}

class RightTextRow extends StatefulWidget {
  String title;
  Function() onpress;
  RightTextRow({required this.title, required this.onpress});

  @override
  State<RightTextRow> createState() => _RightTextRowState();
}

class _RightTextRowState extends State<RightTextRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () {
            Get.defaultDialog(
                title: 'موضوع',
                content: Column(
                  children: [
                    MyTextField(
                      hint: "نام موضوع",
                      controller:
                          Get.find<FieildControllers>().categoryFieldController,
                    ),
                    ElevatedButton(
                      onPressed: widget.onpress,
                      child: Text(
                        "اضافه کردن",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                    )
                  ],
                ));
          },
          child: Text(
            "اضافه کردن موضوع ",
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green),
          ),
        ),
        Text(
          widget.title,
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
        ),
      ],
    );
  }
}
