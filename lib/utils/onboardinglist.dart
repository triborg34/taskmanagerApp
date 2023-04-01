import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';

List<OnbordingData> OnBardingList = [
  OnbordingData(
      fit: BoxFit.fill,
      image: AssetImage(
        'assets/images/1.png',
      ),
      titleText: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        child: Text(
          "!به برنامه مدیریت کارها خوش امدید",
          style: TextStyle(
              color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      descText: Text("")),
  OnbordingData(
      fit: BoxFit.fill,
      image: AssetImage('assets/images/2.png'),
      titleText: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        child: Text("!به آسانی تمام روز خود را مدیریت کنید",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
      descText: Text("")),
  OnbordingData(
      fit: BoxFit.fill,
      image: AssetImage('assets/images/3.png'),
      titleText: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(15)),
        child: Text("!بریم که داشته باشیم",
            style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold)),
      ),
      descText: Text("")
)];

List<Color> colors = [
  Colors.green,
  Colors.greenAccent,
  Colors.lightGreen,
  Colors.lightGreenAccent
];

class DumyList {
  int id;
  String dumyname;

  DumyList({required this.id, required this.dumyname});
}

List<DumyList> dumylist = [
  DumyList(id: 1, dumyname: "وب"),
  DumyList(id: 2, dumyname: "موبایل"),
  DumyList(id: 3, dumyname: "باربری"),
  DumyList(id: 4, dumyname: "تعمیر کامپیوتر"),
  DumyList(id: 5, dumyname: "دولپ سخت افزار"),
];
