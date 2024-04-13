import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskmannager/consts.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/screens/search_screen.dart';

class SearchBar2 extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: boxshadow,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                bottomLeft: Radius.circular(100),
                bottomRight: Radius.circular(30),
                topRight: Radius.circular(30))),
        height: 50,
        width: ScreenSize(context).screenWith,
        child: Center(
          child: TextField(
            controller: Get.find<FieildControllers>().searchbarController,
            onSubmitted: (text) {
              List searchlist=[];

              for(var values in Get.find<TaskAndPRojBox>().projList){
                if(values.title.toLowerCase().contains(text.toLowerCase())){
                  print(values.title.toLowerCase().contains(text.toLowerCase()));
                  searchlist.add(values.title);
                }
              }
                for(var values in Get.find<TaskAndPRojBox>().taskList){
                if(values.title.toLowerCase().contains(text.toLowerCase())){
                  searchlist.add(values.title);
                }
              }
              Get.to(()=> SearchScreen(showList: searchlist,text: text,));
              
            },
            cursorColor: Colors.lightGreen,
            cursorHeight: 20,
            expands: false,
            textDirection: TextDirection.rtl,
            style: TextStyle(
                color: Colors.grey.shade700, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
                label: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "جستجو...",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.grey.shade700),
                  ),
                ),

                // hintText: "جستجو...",
                hintTextDirection: TextDirection.rtl,
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, style: BorderStyle.none))),
          ),
        ),
      ),
      CircleAvatar(
        child: Icon(
          Icons.search,
          color: Color.fromARGB(255, 255, 255, 255),
          size: 28,
        ),
        radius: 25,
        backgroundColor: Colors.green,
      ),
    ]);
  }
}
