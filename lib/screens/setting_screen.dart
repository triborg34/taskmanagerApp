import 'dart:io';

import 'package:flutter/material.dart';

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
                      onpress: () {},
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    MySettingRows(
                        title: "پاک کردن کارها",
                        iconData: Icons.delete,
                        onpress: () {}),
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
