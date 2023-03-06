import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:get/get.dart';
import 'package:taskmannager/consts.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/widgets/HelloText.dart';
import 'package:taskmannager/widgets/ListView.dart';
import 'package:taskmannager/widgets/MyListTilew.dart';
import 'package:taskmannager/widgets/RowText.dart';
import 'package:taskmannager/widgets/Searchbar.dart';

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
                child: GetBuilder<TaskAndPRojBox>(id: 5,builder: (controller) {
                  return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.lightGreen,
                          radius: 25,
                        ),
                        Spacer(),
                        HelloTextWidget(),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SearchBar(),
                    SizedBox(
                      height: 25,
                    ),
                    RowTexts(name: 'پروژه ها'),
                    SizedBox(
                      height: 10,
                    ),
                    MyCardWidget(),
                    SizedBox(
                      height: 15,
                    ),
                    RowTexts(name: 'کار های روزانه'),
                    SizedBox(
                      height: 10,
                    ),
                    for (var i = 0;
                        i < Get.find<TaskAndPRojBox>().taskList.length;
                        i++)
                       MyListTileWidget(i: i)
                  ],
                );
                },)
              ),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40)),
        ),
      ),
    );
  }
}
