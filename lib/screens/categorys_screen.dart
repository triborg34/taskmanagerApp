import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/models/catogeryModel.dart';
import 'package:taskmannager/widgets/myTextField.dart';

class CategoryeScreen extends StatelessWidget {
  const CategoryeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
        margin: EdgeInsets.all(25),
        child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(height: 15,),
          itemCount: Get.find<TaskAndPRojBox>().catList.length,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(15)),
                child:GestureDetector (
                  onLongPress: () {
                    Get.find<TaskAndPRojBox>().catBox.deleteAt(index);
                    Get.find<TaskAndPRojBox>().getCatData();
                  },
                  onTap: () {
                    Get.find<FieildControllers>().categoryFieldController.text=Get.find<TaskAndPRojBox>().catList[index].name;

                     Get.defaultDialog(
                title: 'موضوع',
                content: Column(
                  children: [
                    MyTextField(
                      hint: "نام موضوع",
                      controller:
                          Get.find<FieildControllers>().categoryFieldController,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        CategoryModel categoryModel = CategoryModel(
                      name: Get.find<FieildControllers>()
                          .categoryFieldController
                          .text);
                  Get.find<TaskAndPRojBox>().catBox.putAt(index, categoryModel);
                  Get.find<TaskAndPRojBox>().getCatData();
                  
                  Navigator.pop(context);
                      },
                      child: Text(
                        "اضافه کردن",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      style:
                          TextButton.styleFrom(backgroundColor: Colors.green),
                    )
                  ],
                ));
                  },
                  child: Row(mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text(Get.find<TaskAndPRojBox>().catList[index].name,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),)],
                  ),
                ),
              ),
            );
          },
        ),
            ),
          ));
  }
}
