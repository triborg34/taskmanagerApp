import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:taskmannager/consts.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/utils/newfuncs.dart';
import 'package:taskmannager/widgets/HelloText.dart';
import 'package:taskmannager/widgets/ListView.dart';
import 'package:taskmannager/widgets/MyListTilew.dart';
import 'package:taskmannager/widgets/RowText.dart';
import 'package:taskmannager/widgets/Searchbar.dart';
import 'package:taskmannager/widgets/empty.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: ScreenSize(context).screenWith,
          height: ScreenSize(context).screenHeight,
          child: Padding(
              child: SingleChildScrollView(
                  child: GetBuilder<TaskAndPRojBox>(
                id: 5,
                builder: (controller) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CircleAvatar(
                            child: Image.asset(getAvtar()),
                            backgroundColor: Colors.transparent,
                            radius: 35,
                          ),
                          Spacer(),
                          HelloTextWidget(),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SearchBar2(),
                      SizedBox(
                        height: 25,
                      ),
                      RowTexts(name: 'پروژه ها'),
                      SizedBox(
                        height: 10,
                      ),
                      GetBuilder<TaskAndPRojBox>(builder: (controller) {
                        if (Get.find<TaskAndPRojBox>().projList.isNotEmpty) {
                          return MyCardWidget();
                        } else {
                          return GestureDetector(
                              onTap: () {
                                newproj(DateTime.now().day.toString(),
                                    DateTime.now());

                                Get.toNamed('/newproj');
                              },
                              child: Empty('assets/images/empty1.png'));
                        }
                      }),
                      SizedBox(
                        height: 15,
                      ),
                      RowTexts(name: 'کار های روزانه'),
                      SizedBox(
                        height: 10,
                      ),
                      if (Get.find<TaskAndPRojBox>().taskList.isNotEmpty)
                        for (var i = 0;
                            i < Get.find<TaskAndPRojBox>().taskList.length;
                            i++)
                          MyListTileWidget(i: i)
                      else
                        GestureDetector(
                            onTap: () {
                              newtask('تاریخ');
                              Get.toNamed('/newtask');
                            },
                            child: Empty('assets/images/empty2.png'))
                    ],
                  );
                },
              )),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40)),
        ),
      ),
    );
  }
}
