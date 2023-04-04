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
      appBar: AppBar(backgroundColor: Colors.green),
      body: Container(
          margin: EdgeInsets.all(25),
          child: GetBuilder<TaskAndPRojBox>(
            id: 19,
            builder: (controller) => ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 15,
              ),
              itemCount: Get.find<TaskAndPRojBox>().catList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(15)),
                    child: GestureDetector(
                      onLongPress: () {
                        Get.defaultDialog(
                            middleText: '',
                            confirm: ElevatedButton(
                              onPressed: () {
                                Get.find<TaskAndPRojBox>()
                                    .catBox
                                    .deleteAt(index);
                                Get.find<TaskAndPRojBox>().getCatData();
                                controller.update([19]);
                                Navigator.pop(context);
                              },
                              child: Text(
                                "بله",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: TextButton.styleFrom(
                                  backgroundColor: Colors.green),
                            ),
                            cancel: ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                "خیر",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: Colors.red,
                              ),
                            ),
                            backgroundColor: Colors.green,
                            title: "ایا مایل به حذف هستید؟",
                            titleStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold));

                        ;
                      },
                      onTap: () {
                        Get.find<FieildControllers>()
                                .categoryFieldController
                                .text =
                            Get.find<TaskAndPRojBox>().catList[index].name;

                        Get.defaultDialog(
                            title: 'موضوع',
                            content: Column(
                              children: [
                                MyTextField(
                                  hint: "نام موضوع",
                                  controller: Get.find<FieildControllers>()
                                      .categoryFieldController,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    CategoryModel categoryModel = CategoryModel(
                                        name: Get.find<FieildControllers>()
                                            .categoryFieldController
                                            .text);
                                    Get.find<TaskAndPRojBox>()
                                        .catBox
                                        .putAt(index, categoryModel);
                                    Get.find<TaskAndPRojBox>().getCatData();
                                    controller.update([19]);
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "ویرایش",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  style: TextButton.styleFrom(
                                      backgroundColor: Colors.green),
                                )
                              ],
                            ));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            Get.find<TaskAndPRojBox>().catList[index].name,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )),
    ));
  }
}
