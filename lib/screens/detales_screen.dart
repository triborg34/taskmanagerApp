import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taskmannager/consts.dart';
import 'package:taskmannager/widgets/RowText.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatelessWidget {
  bool isProject;
  List<dynamic> list = [];
  DetailsScreen({required this.isProject, required this.list});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.green,
          body: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(15),
            height: ScreenSize(context).screenHeight,
            width: ScreenSize(context).screenWith,
            child: isProject ? projectDetails(list) : taskDetails(list),
          )),
    );
  }
}

Widget projectDetails(List<dynamic> projlist) {
  return Column(
    children: [
      CoustomAppbar(list: projlist,),
      Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.green),
        child: Text(
          projlist.first.desp,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TimeContainter(
            text: "تاریخ پایان:${projlist.first.endTime}",
          ),
          TimeContainter(
            text: "تاریخ شروع:${projlist.first.startTime}",
          )
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            Text(
              ":موضوعات",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            SizedBox(
              width: 15,
            ),
            for (var values in projlist.first.category)
              _categorysProject(values)
          ],
        ),
      ),
      SizedBox(
        height: 15,
      ),
      RowTexts(name: "کار های مربوطه"),

      for(var values in projlist.first.tasks) _relatedTaskToPoject(values),
      
      
    ],
  );
}


Widget taskDetails(List tasklist) {
  return Column(
    children: [
      CoustomAppbar(list:tasklist),
       Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25), color: Colors.green),
        child: Text(
          tasklist.first.subtitle,
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.w900),
        ),
      ),
      Wrap(alignment: WrapAlignment.spaceBetween,
      direction: Axis.horizontal,

      

      textDirection: TextDirection.rtl,
      spacing: 5,
        children: [
        TimeContainter(text: "تاریخ:${tasklist.first.time}"),
        TimeContainter(text: "پروژه مربوطه:${tasklist.first.projectRelate}"),
        TimeContainter(text: tasklist.first.status ? 'تکمیل شده' : "تکمیل نشده")


      ],)

      
    ],
  );
}




Container _categorysProject(values) {
  return Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  values.name,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ));
}

// ignore: must_be_immutable
class CoustomAppbar extends StatelessWidget {
  List list=[];
  CoustomAppbar({required this.list});

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
              backgroundColor: Colors.white,
              child: IconButton(
                icon: Icon(Icons.keyboard_arrow_left_outlined),
                onPressed: () {
                  Get.back();
                },
              )),
          Text(
            
            list.first.title.toUpperCase(),
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white),
            textDirection: TextDirection.rtl,
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
    );
  }
}

Widget _relatedTaskToPoject(values) {
  return Container(
    margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.green,),
      child: Row(textDirection: TextDirection.rtl,
        children: [Icon(Icons.task,color: Colors.white,size: 28,),SizedBox(width: 10,),
          Text(values,style: TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
        ],
      ),
    );
}

// ignore: must_be_immutable
class TimeContainter extends StatelessWidget {
  String text;
  TimeContainter({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        text,
        style: TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700),
        textAlign: TextAlign.center,
        textDirection: TextDirection.rtl,
      ),
    );
  }
}

