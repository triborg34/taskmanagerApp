import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:taskmannager/consts.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/models/taskModel.dart';
import 'package:taskmannager/screens/newtask_screen.dart';
import 'package:taskmannager/utils/maths.dart';

class MyListTileWidget extends StatelessWidget {
  MyListTileWidget({
    Key? key,
    required this.i,
  }) : super(key: key);

  final int i;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          width: ScreenSize(context).screenWith,
          height: 150,
          decoration: BoxDecoration(
              color: colors[0], borderRadius: BorderRadius.circular(15)),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: GestureDetector(
            onLongPress: () {
              showDialog(
                context: context,
                builder: (context) {
                  return Dialog(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          DialogButtons(
                            text: "تکمیل شده",
                            iconData: Icons.bookmark_add,
                            onpress: () {
                              Get.find<TaskAndPRojBox>().taskList[i].status =
                                  true;
                              Get.find<TaskAndPRojBox>().hivebox.putAt(
                                  i,
                                  TaskModel(
                                      projectRelate: Get.find<TaskAndPRojBox>()
                                          .taskList[i]
                                          .projectRelate,
                                      title: Get.find<TaskAndPRojBox>()
                                          .taskList[i]
                                          .title,
                                      subtitle: Get.find<TaskAndPRojBox>()
                                          .taskList[i]
                                          .subtitle,
                                      time: Get.find<TaskAndPRojBox>()
                                          .taskList[i]
                                          .time,
                                      status: Get.find<TaskAndPRojBox>()
                                          .taskList[i]
                                          .status));
                              cacluteprogress();
                              Get.find<TaskAndPRojBox>().update([5]);
                              Navigator.pop(context);
                            },
                          ),
                          Divider(
                            color: Colors.white,
                            height: 2,
                          ),
                          DialogButtons(
                            text: "ویرایش",
                            iconData: Icons.edit,
                            onpress: () {
                              Get.find<FieildControllers>().currentindex = i;
                              Get.find<FieildControllers>().isEditing = true;
                              Get.find<FieildControllers>()
                                      .taskFieldController
                                      .text =
                                  Get.find<TaskAndPRojBox>().taskList[i].title;
                              Get.find<FieildControllers>()
                                      .noteFieldController
                                      .text =
                                  Get.find<TaskAndPRojBox>()
                                      .taskList[i]
                                      .subtitle;
                              Get.find<TaskController>().defuiltTime =
                                  Get.find<TaskAndPRojBox>().taskList[i].time;

                              Get.to(NewTask());
                            },
                          ),
                          Divider(
                            color: Colors.white,
                            height: 2,
                          ),
                          DialogButtons(
                            text: "حذف",
                            iconData: Icons.delete,
                            onpress: () {
                              Get.find<TaskAndPRojBox>().hivebox.deleteAt(i);
                              Get.find<TaskAndPRojBox>().getTaskData();
                              Get.find<TaskAndPRojBox>().update([5]);
                              Navigator.pop(context);
                            },
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 10),
              width: ScreenSize(context).screenWith,
              height: 155,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          child: Text(
                            Get.find<TaskAndPRojBox>().taskList[i].title,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Container(
                            width: 200,
                            child: Text(
                              Get.find<TaskAndPRojBox>().taskList[i].subtitle,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 20, color: Colors.grey.shade700),
                            )),
                            SizedBox(height: 3,),
                        Container(
                          width: 100,
                          height: 25,
                          child: Center(
                            child: Text(
                              Get.find<TaskAndPRojBox>().taskList[i].status
                                  ? "Complete"
                                  : "Not  Complete",
                              style: TextStyle(
                                  color: colors[0],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: colorswithopacity[0],
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Text(
                          Get.find<TaskAndPRojBox>().taskList[i].time,
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        )
                      ]),
                  CircularPercentIndicator(
                    radius: 40,
                    backgroundColor: Colors.grey.withOpacity(0.5),
                    progressColor: colors[0],
                    percent:
                        Get.find<TaskAndPRojBox>().taskList[i].status ? 1.0 : 0,
                    animation: true,
                  )
                ],
              ),
              decoration: BoxDecoration(
                  boxShadow: boxshadow,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
            ),
          ),
        )
      ],
    );
  }
}

// ignore: must_be_immutable
class DialogButtons extends StatelessWidget {
  IconData iconData;
  String text;
  Function() onpress;

  DialogButtons(
      {required this.iconData, required this.text, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Row(
        children: [
          Container(
            width: 220,
            height: 50,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  text,
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 18),
                ),
                Icon(
                  iconData,
                  color: Colors.white,
                  size: 26.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
