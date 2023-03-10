import 'package:flutter/material.dart';

import 'package:taskmannager/consts.dart';
import 'package:taskmannager/widgets/RowText.dart';

class DetailsScreen extends StatelessWidget {
  bool isProject = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        margin: EdgeInsets.all(25),
        height: ScreenSize(context).screenHeight,
        width: ScreenSize(context).screenWith,
        child: isProject ? projectDetails() : taskDetails(),
      )),
    );
  }
}

Widget projectDetails() {
  return Column(
    
    children: [
      Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(25)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(Icons.keyboard_arrow_left_outlined),
                  onPressed: () {},
                ))
                ,Text("This Is Title",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),textDirection: TextDirection.rtl,)
                ,SizedBox(width: 25,)
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: Colors.green),
        child: Text("This Is Very Long Despricton for this Project Only And Only",textAlign: TextAlign.center,textDirection: TextDirection.rtl,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900),),
      ),
      
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TimeContainter(text: "تاریخ پایان:1401/01/01",),
          TimeContainter(text: "تاریخ شروع:1401/01/01",)

        ],
      ),SizedBox(height: 15,)
     ,Container(
      padding: EdgeInsets.all(10),
      
      decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),
       child: Row(textDirection: TextDirection.rtl,children: [
        Text(":موضوعات",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.white),),

        
       ],),
     ),SizedBox(height: 15,),
     RowTexts(name: "کار های مربوطه"),
     
    ],
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
      decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(25),),
      child: Text(text,style: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.w700),textAlign: TextAlign.center,textDirection: TextDirection.rtl,),
    );
  }
}

Widget taskDetails() {
  return Container();
}
