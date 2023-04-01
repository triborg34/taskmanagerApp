import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:taskmannager/consts.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/screens/newProje_screen.dart';

class MyCardWidget extends StatelessWidget {
  const MyCardWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      child: ListView.separated(
        separatorBuilder: (context, index) {
          return SizedBox(
            width: 10,
          );
        },
        scrollDirection: Axis.horizontal,
        itemCount: Get.find<TaskAndPRojBox>().projList.length ,
        itemBuilder: (context, index) {
          var i=index;
          if(i>index){
            i=0;
          }
          
          
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            width: 300,
            decoration: BoxDecoration(
                color: colors[i], borderRadius: BorderRadius.circular(10)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        "${Get.find<TaskAndPRojBox>().remindTime[index]} روز مانده",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w800,
                            fontSize: 14),
                      ),
                    ),
                    width: 100,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  PopupMenuButton(
                      elevation: 0,
                      icon: Icon(
                        Icons.more_vert,
                        size: 30,
                        color: Colors.white,
                      ),
                      itemBuilder: ((context) {
                        return [
                          PopupMenuItem(
                              child: ElevatedButton(
                                style: TextButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: () {
                              Get.find<TaskAndPRojBox>().projbox.deleteAt(index);
                              Get.find<TaskAndPRojBox>().getProjData();
                              Get.find<TaskAndPRojBox>().update([5]);
                              
                            },
                            child: Text("حذف "),
                          )),
                          
                          PopupMenuItem(
                              child: ElevatedButton(
                                style:  TextButton.styleFrom(backgroundColor: Colors.green),
                            onPressed: () {
                                Get.find<FieildControllers>().currentindex=index;
                                Get.find<FieildControllers>().isEditing=true;

                              Get.find<FieildControllers>().titleController.text=Get.find<TaskAndPRojBox>().projList[index].title;
                              Get.find<FieildControllers>().despController.text=Get.find<TaskAndPRojBox>().projList[index].desp;
                              Get.find<FieildControllers>().startTime=Get.find<TaskAndPRojBox>().projList[index].startTime;
                              Get.find<FieildControllers>().endTime=Get.find<TaskAndPRojBox>().projList[index].endTime;
                              Get.find<TaskController>().defuiltTime=Get.find<TaskAndPRojBox>().projList[index].endTime;
                              Get.find<FieildControllers>().progress.text=Get.find<TaskAndPRojBox>().projList[index].progress.toString();
                              Get.find<FieildControllers>().categorys=Get.find<TaskAndPRojBox>().projList[index].category;
                              Get.find<TimeAndDateController>().displayDay=Get.find<TaskAndPRojBox>().projList[index].startTime.split('/')[2];
                              Get.find<TimeAndDateController>().currentDateTime=Get.find<TaskAndPRojBox>().projList[index].datetime;

                              Get.to(NewProjectScreen());
                              




                            },
                            child: Text("ویرایش"),
                          ))
                        ];
                      }))
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                Get.find<TaskAndPRojBox>().projList[index].title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                overflow: TextOverflow.ellipsis,
                Get.find<TaskAndPRojBox>().projList[index].desp,
                style: TextStyle(
                    fontSize: 16, color: Colors.white.withOpacity(0.8)),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Progress",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Get.find<TaskAndPRojBox>().projList[index].progress.toString(),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 15),
              LinearPercentIndicator(
                animation: true,
                backgroundColor: Colors.white.withOpacity(0.4),
                percent: Get.find<TaskAndPRojBox>().projList[index].progress*0.01,
                progressColor: Colors.white,
              )
            ]),
          );
        },
      ),
    );
  }
}
