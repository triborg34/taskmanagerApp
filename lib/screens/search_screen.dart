import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:taskmannager/consts.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/models/projModel.dart';
import 'package:taskmannager/models/taskModel.dart';
import 'package:taskmannager/screens/detales_screen.dart';

class SearchScreen extends StatelessWidget {
  List showList=[];
  String text;
  SearchScreen({required this.showList,required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text(
          text,
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
          child: Container(
        width: ScreenSize(context).screenWith,
        height: ScreenSize(context).screenHeight,
        child: Container(
          margin: EdgeInsets.all(15),
          height: 200,
          child: ListView.separated(
            separatorBuilder: (context, index) => Divider(
              height: 10,
              color: Colors.black,
              thickness: 1,
            ),
            itemCount: showList.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  onTap: (){
                    List<Project> projectList=[];
                    List<TaskModel> taskList=[];

                   
                   if(Get.find<TaskAndPRojBox>().projList.where((element) => element.title.contains(text)).isNotEmpty){
                    projectList=Get.find<TaskAndPRojBox>().projList.where((element) => element.title.contains(text)).toList();
                    print("inja");
                    Get.to(()=> DetailsScreen(isProject: true, list: projectList));
                   }else{
                    
                    taskList=Get.find<TaskAndPRojBox>().taskList.where((element) => element.title.contains(text)).toList();
                   }
                   
                   
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        showList[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      )),
    );
  }
}
