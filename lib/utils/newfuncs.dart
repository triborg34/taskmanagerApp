import 'dart:math';

import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';

void newproj() {
  Get.find<TimeAndDateController>().displayDay = DateTime.now().day.toString();
  Get.find<FieildControllers>().titleController.text = '';
  Get.find<FieildControllers>().despController.text = '';
  Get.find<TaskController>().defuiltTime = "تاریخ";
  Get.find<FieildControllers>().isEditing = false;
  Get.find<TimeAndDateController>().currentDateTime = DateTime.now();
}

void newtask() {
  Get.find<FieildControllers>().isEditing = false;
  Get.find<FieildControllers>().taskFieldController.text = '';
  Get.find<FieildControllers>().noteFieldController.text = '';
  Get.find<TaskController>().defuiltTime = "تاریخ";
  Get.find<TaskController>().displayvalue = Get.find<TaskController>().items[0];
}

String getAvtar() {
  String commonPaths = 'assets/images';

  List<String> avatarPaths = [
    '$commonPaths/avatar1.png',
    '$commonPaths/avatar2.png',
    '$commonPaths/avatar3.png',
    '$commonPaths/avatar4.png',
    '$commonPaths/avatar5.png',
    '$commonPaths/avatar6.png'
  ];

  final _random=Random();
  String choice=avatarPaths[_random.nextInt(avatarPaths.length)];
  return choice;
}
