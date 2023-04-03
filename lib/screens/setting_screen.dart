import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/screens/home_screen.dart';

import 'package:taskmannager/widgets/settingRows.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.green,
            centerTitle: true,
            title: Row(
                key: key,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "تظیمات",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.settings),
                ]),
          ),
          body: Container(
            child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    MySettingRows(
                      title: "پاک کردن پروژه ها",
                      iconData: Icons.delete_sweep,
                      onpress: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Center(
                                child: CircularProgressIndicator(
                              color: Colors.green,
                              strokeWidth: 6.0,
                            ));
                          },
                        );
                        Future.delayed(Duration(seconds: 2))
                            .then((value) {
                                 Get.find<TaskAndPRojBox>().projbox.clear();
                                 Get.find<TaskAndPRojBox>().projList.clear();
                        Get.find<TaskAndPRojBox>().getProjData();

                              Navigator.pop(context);
                            });
                       
                      },
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MySettingRows(
                        title: "پاک کردن کارها",
                        iconData: Icons.delete,
                        onpress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Center(
                                  child: CircularProgressIndicator(
                                color: Colors.green,
                                strokeWidth: 6.0,
                              ));
                            },
                          );
                          Future.delayed(Duration(seconds: 2)).then((value) {
                            Get.find<TaskAndPRojBox>().hivebox.clear();
                            Get.find<TaskAndPRojBox>().taskList.clear();

                            Get.find<TaskAndPRojBox>().getTaskData();
                            
                            Navigator.pop(context);
                          });
                         
                        }),
                    SizedBox(height: 15),
                    MySettingRows(
                        title: "بستن برنامه",
                        iconData: Icons.exit_to_app,
                        onpress: () {
                          exit(0);
                        })
                  ],
                )),
          )),
    );
  }
}
