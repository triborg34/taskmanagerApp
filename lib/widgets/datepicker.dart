import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persian_datetimepickers/persian_datetimepickers.dart';
import 'package:taskmannager/controller/controller.dart';

Widget dateTimePicker(BuildContext context) {
  return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(15)),
      height: 50,
      child: GetBuilder<TaskController>(
        id: 2,
        builder: (controller) => TextButton(
            child: Text(
              Get.find<TaskController>().defuiltTime,
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
            onPressed: () async {
              var datepicker = await showPersianDatePicker(
                  initialDate: DateTime.now(),
                  context: context,
                  isJalali: false);
              Get.find<TaskController>().year = datepicker!.year.toString();
              Get.find<TaskController>().month = datepicker.month.toString();
              Get.find<TaskController>().day = datepicker.day.toString();
              Get.find<TaskController>().defuiltTime =
                  Get.find<TaskController>().year +
                      '/' +
                      Get.find<TaskController>().month +
                      '/' +
                      Get.find<TaskController>().day;
              Get.find<FieildControllers>().dateController =
                  Get.find<TaskController>().defuiltTime;
              Get.find<FieildControllers>().endTime =
                  Get.find<TaskController>().defuiltTime;
              Get.find<TaskController>().update([2]);
            }),
      ));
}
