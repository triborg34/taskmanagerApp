// ignore_for_file: must_be_immutable, unused_field

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:taskmannager/consts.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/models/catogeryModel.dart';
import 'package:taskmannager/models/projModel.dart';
import 'package:taskmannager/models/taskModel.dart';
import 'package:taskmannager/screens/MainViewPage.dart';
import 'package:taskmannager/utils/date_timeUtil.dart' as date_util;
import 'package:taskmannager/utils/onboardinglist.dart';

import 'package:taskmannager/widgets/datepicker.dart';
import 'package:taskmannager/widgets/myArrows.dart';
import 'package:taskmannager/widgets/myTextField.dart';

class NewProjectScreen extends StatefulWidget {
  const NewProjectScreen({super.key});

  @override
  State<NewProjectScreen> createState() => _NewProjectScreenState();
}

class _NewProjectScreenState extends State<NewProjectScreen> {


  List _selectedValues = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  ScrollController scrollController =
      Get.find<TimeAndDateController>().scrollController;
  List<DateTime> currentMonthList =
      Get.find<TimeAndDateController>().currentMonthList;
  DateTime currentDateTime = Get.find<TimeAndDateController>().currentDateTime;

  TextEditingController controller =
      Get.find<TimeAndDateController>().controller;
  String displayDay = Get.find<TimeAndDateController>().displayDay;

  Widget TopView(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(15, 60, 15, 0),
      height: ScreenSize(context).screenHeight * 0.35,
      color: Colors.green,
      child: Column(
        children: [
          TitleAndBackWidget(),
          SizedBox(
            height: 10,
          ),
          GetBuilder<TimeAndDateController>(
            id: 1,
            builder: (controller) => DisplayedDate(
                displayDay: displayDay, currentDateTime: currentDateTime),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            width: ScreenSize(context).screenWith,
            height: 110,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return capsuleView(index);
              },
              itemCount: currentMonthList.length,
            ),
          )
        ],
      ),
    );
  }

  Widget capsuleView(int index) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: GestureDetector(
          onTap: () {
            currentDateTime = currentMonthList[index];
            displayDay = currentDateTime.day.toString();
            Get.find<FieildControllers>().startTime =
                "${currentDateTime.year}/0${currentDateTime.month}/0${currentDateTime.day}";
            Get.find<TimeAndDateController>().update([1]);
          },
          child: GetBuilder<TimeAndDateController>(
            id: 1,
            builder: (controller) => Container(
              height: 110,
              width: 59,
              decoration: BoxDecoration(
                  color: currentMonthList[index].day != currentDateTime.day
                      ? Colors.transparent
                      : Colors.white,
                  borderRadius: BorderRadius.circular(60)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 26,
                    backgroundColor:
                        currentMonthList[index].day != currentDateTime.day
                            ? Colors.transparent
                            : Colors.green,
                    child: Text(
                      date_util.DateUtils
                          .weekdays[currentMonthList[index].weekday - 1],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color:
                              currentMonthList[index].day != currentDateTime.day
                                  ? Colors.white.withOpacity(0.8)
                                  : Colors.white),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    currentMonthList[index].day.toString(),
                    style: TextStyle(
                        color:
                            currentMonthList[index].day != currentDateTime.day
                                ? Colors.white
                                : Colors.green,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          )),
    );
  }

  Widget BottomView(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(45),
        width: ScreenSize(context).screenWith,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50), topRight: Radius.circular(50))),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyTextField(
                hint: "نام پروژه ...",
                controller: Get.find<FieildControllers>().titleController,
              ),
              SizedBox(
                height: 15,
              ),
              MyTextField(
                hint: "توضیحات",
                controller: Get.find<FieildControllers>().despController,
              ),
              SizedBox(
                height: 30,
              ),
              RightTextRow(
                title: "موضوعات",
                onpress: () {
                  CategoryModel categoryModel = CategoryModel(
                      name: Get.find<FieildControllers>()
                          .categoryFieldController
                          .text);
                  Get.find<TaskAndPRojBox>().catBox.add(categoryModel);
                  Get.find<TaskAndPRojBox>().getCatData();
                  
                  Navigator.pop(context);
                 
                 
                },
              ),
              GetBuilder<TaskAndPRojBox>(builder: (controller) {
                controller.addListener(() => controller.update(),);
                return MultiSelectChipField(
                items:Get.find<TaskAndPRojBox>()
      .catList
      .map((value) => MultiSelectItem(value, value.name))
      .toList() ,
                initialValue: Get.find<FieildControllers>().isEditing ? Get.find<TaskAndPRojBox>().projList[Get.find<FieildControllers>().currentindex].category : [],
                key: _multiSelectKey,
                
                selectedChipColor: Colors.blue.withOpacity(0.5),
                selectedTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w800),
                chipColor: Colors.green,
                showHeader: false,
                onTap: (values) {
                  Get.find<FieildControllers>().categorys = values;
                },
                decoration: BoxDecoration(),
                textStyle: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
                chipShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
              );
              
              },) ,
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Visibility(
                      visible: Get.find<FieildControllers>().isEditing,
                      child: Container(
                        height: 50,
                        width: 100,
                        child: TextField(
                          controller: Get.find<FieildControllers>().progress,
                          decoration: InputDecoration(
                            hintText: "progress",
                            
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(color: Colors.green)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(color: Colors.green)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                borderSide: BorderSide(color: Colors.green)),
                          ),
                        ),
                      )),
                  Row(
                    children: [
                      dateTimePicker(context),
                      Text(
                        "   تا تاریخ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                onPressed: () {
                  Project project = Project(
                      Get.find<FieildControllers>().categorys, 
                      title: Get.find<FieildControllers>().titleController.text,
                      desp: Get.find<FieildControllers>().despController.text,
                      startTime: Get.find<FieildControllers>().startTime,
                      endTime: Get.find<FieildControllers>().endTime!,
                      datetime: currentDateTime,
                      progress: int.parse(Get.find<FieildControllers>().progress.text));



                  if(Get.find<FieildControllers>().isEditing){
                    Get.find<TaskAndPRojBox>().projbox.putAt(Get.find<FieildControllers>().currentindex, project);
                    print(int.parse(Get.find<FieildControllers>().progress.text));

                  }else{Get.find<TaskAndPRojBox>().projbox.add(project);}
                  


                  Get.find<TaskAndPRojBox>().getProjData();
                 
                 
                  Get.to(()=> MainViewPage());
                  
                },
                child: Text(
                  Get.find<FieildControllers>().isEditing ? "ویرایش پروژه" : "اضافه کردن پروژه",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                style: TextButton.styleFrom(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    fixedSize: Size(ScreenSize(context).screenWith, 50),
                    backgroundColor: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(children: [
        TopView(context),
        BottomView(context),
      ]),
    );
  }
}

class DisplayedDate extends StatelessWidget {
  const DisplayedDate({
    Key? key,
    required this.displayDay,
    required this.currentDateTime,
  }) : super(key: key);

  final String displayDay;
  final DateTime currentDateTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GetBuilder<TimeAndDateController>(
          id: 1,
          builder: (_) => Text(
            "${displayDay} ${date_util.DateUtils.months[currentDateTime.month - 1]} ${currentDateTime.year} ",
            style:
                TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 18),
          ),
        ),
      ],
    );
  }
}

class TitleAndBackWidget extends StatelessWidget {
  const TitleAndBackWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_circle_left,
            color: Colors.white,
            size: 42,
          ),
        ),
        Text(
          Get.find<FieildControllers>().isEditing ? "ویرایش" : "افزوردن",
          style: TextStyle(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 35,
        )
      ],
    );
  }
}

List relatedTasks() {
  List reletedtask = [];
  for (var values in Get.find<TaskAndPRojBox>().taskList) {
    if (Get.find<FieildControllers>().titleController.text ==
        values.projectRelate) {
      reletedtask.add(values.title);
    }
  }
  
  return reletedtask;
}
