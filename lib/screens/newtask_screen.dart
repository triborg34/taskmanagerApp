import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/models/taskModel.dart';
import 'package:taskmannager/screens/MainViewPage.dart';
import 'package:taskmannager/widgets/datepicker.dart';
import 'package:taskmannager/widgets/dropDownproject.dart';

class NewTask extends StatelessWidget {
  const NewTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MyCoustomAppbar(),
          TitleWidget(),
          TaskField(),
          NoteWidget(),
          DateAndProje(context),
          SizedBox(
            height: 50,
          ),
          Mybutton()
        ],
      )),
    );
  }
}

Widget DateAndProje(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      dateTimePicker(context),
      dropDownProject(),
    ],
  );
}

class Mybutton extends StatelessWidget {
  const Mybutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: 40,
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: () {
          TaskModel taskModel = TaskModel(
              projectRelate: Get.find<FieildControllers>().relatedProject!,
              title: Get.find<FieildControllers>().taskFieldController.text,
              subtitle: Get.find<FieildControllers>().noteFieldController.text,
              time: Get.find<FieildControllers>().dateController!,
              status: Get.find<FieildControllers>().status);



          if(Get.find<FieildControllers>().isEditing){
              Get.find<TaskAndPRojBox>().hivebox.putAt( Get.find<FieildControllers>().currentindex, taskModel);
          }
          else{Get.find<TaskAndPRojBox>().hivebox.add(taskModel);}

          Get.find<TaskAndPRojBox>().getTaskData();
           Get.to(()=> MainViewPage());
        },
        child: Text(Get.find<FieildControllers>().isEditing ? "ویرایش کردن" : "اضافه کردن"),
        style:
            TextButton.styleFrom(elevation: 0, backgroundColor: Colors.green),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  const NoteWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 10),
      child: TextField(
        controller: Get.find<FieildControllers>().noteFieldController,
        maxLength: 30,
        cursorColor: Colors.green,
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.bookmark_border,
              color: Colors.grey,
            ),
            border: InputBorder.none,
            counter: Container(),
            hintText: "...یاداشتی بنویسید"),
      ),
    );
  }
}

class TaskField extends StatelessWidget {
  const TaskField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: Get.find<FieildControllers>().taskFieldController,
        maxLines: 6,
        cursorColor: Colors.green,
        cursorHeight: 40,
        decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade300))),
      ),
    );
  }
}

class TitleWidget extends StatelessWidget {
  const TitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, top: 10),
      child: Text(
        "چکار میخوای کنی؟",
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: TextStyle(
          color: Colors.grey[600],
          fontSize: 18,
        ),
      ),
    );
  }
}

class MyCoustomAppbar extends StatelessWidget {
  const MyCoustomAppbar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(15)),
          margin: EdgeInsets.only(left: 45.0),
          child: Text(
            Get.find<FieildControllers>().isEditing ? "ویرایش کار" : "کار جدید",
            style: TextStyle(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        )),
        Hero(
          tag: 'hero',
          child: Material(
            child: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close)),
          ),
        )
      ],
    );
  }
}
