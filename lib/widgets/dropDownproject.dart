import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';

class dropDownProject extends StatelessWidget {
  const dropDownProject({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(right: 25),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        padding: EdgeInsets.all(5),
        child: GetBuilder<TaskController>(
          id: 3,
          builder: (controller) => DropdownButton(
            hint: Text("پروژه مربوطه را انتخاب کنید"),
            value: Get.find<TaskController>().displayvalue,
            borderRadius: BorderRadius.circular(15),
            elevation: 0,
            dropdownColor: Colors.green,
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            items: Get.find<TaskController>()
                .items
                .map((String items) => DropdownMenuItem(
                    value: items, child: Text(items.toString())))
                .toList(),
            alignment: Alignment.center,
            underline: Text(""),
            onChanged: (value) {
              Get.find<TaskController>().displayvalue = value!;
              Get.find<FieildControllers>().relatedProject = value;
              Get.find<TaskController>().update([3]);
            },
          ),
        ));
  }
}
