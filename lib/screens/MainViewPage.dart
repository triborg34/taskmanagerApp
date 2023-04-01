import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_floating_buttons/animated_floating_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/screens/aboutus_screen.dart';
import 'package:taskmannager/screens/calander_screen.dart';
import 'package:taskmannager/screens/home_screen.dart';
import 'package:taskmannager/screens/newProje_screen.dart';
import 'package:taskmannager/screens/setting_screen.dart';
import 'package:taskmannager/utils/maths.dart';
import 'package:taskmannager/utils/newfuncs.dart';
import 'package:taskmannager/widgets/floatingactionbutton.dart';

class MainViewPage extends StatefulWidget {
  const MainViewPage({super.key});

  @override
  State<MainViewPage> createState() => _MainViewPageState();
}

class _MainViewPageState extends State<MainViewPage> {
  @override
  Widget build(BuildContext context) {
    Get.find<TaskController>().itemadd();
    Get.find<TaskAndPRojBox>().getProjData();
    Get.find<TaskAndPRojBox>().getTaskData();
    remindTimes();
    caculateTasks();
    
    
    return Scaffold(
        body: Obx(() {
          if (Get.find<BottomNavigatenController>().activeindex.value == 1) {
            return CalanderView();
          } else if (Get.find<BottomNavigatenController>().activeindex.value ==
              2) {
            return SettingScreen();
          } else if (Get.find<BottomNavigatenController>().activeindex.value ==
              3) {
            return AboutMe();
          } else {
            return HomeScreen();
          }
        }),
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedFloatingActionButton(
                colorStartAnimation: Colors.green,
                colorEndAnimation: Colors.red,
                animatedIconData: AnimatedIcons.menu_close,
                fabButtons: [
                  fab(() {
                   newproj();



                    Get.toNamed('/newproj');
                  }, "پروژه", "btn1", Icons.add_to_queue),
                  fab(() {
                    newtask();
                    Get.toNamed('/newtask');
                  }, "کار", "btn2", Icons.add_task)
                ],
              ),
              SizedBox(
                width: 35,
              ),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Obx(
          () => AnimatedBottomNavigationBar(
            elevation: 0,
            iconSize: 28,
            icons: [
              Icons.home,
              Icons.calendar_month,
              Icons.settings,
              Icons.mail,
            ],
            gapLocation: GapLocation.center,
            activeIndex:
                Get.find<BottomNavigatenController>().activeindex.value,
            activeColor: Colors.green,
            onTap: (value) {
              Get.find<BottomNavigatenController>().activeindex.value = value;
            },
          ),
        ));
  }
}
