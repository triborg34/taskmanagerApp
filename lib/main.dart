import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:taskmannager/bindings/bindigs.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/models/catogeryModel.dart';
import 'package:taskmannager/models/projModel.dart';
import 'package:taskmannager/models/taskModel.dart';
import 'package:taskmannager/screens/MainViewPage.dart';
import 'package:taskmannager/screens/onboarding.dart';
import 'package:taskmannager/screens/splash_screen.dart';
import 'package:taskmannager/utils/maths.dart';
import 'package:taskmannager/utils/pages.dart';

void main() async {
  await WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  Hive.registerAdapter(CategoryModelAdapter());
  await Hive.openBox<CategoryModel>('cat');

  Hive.registerAdapter(ProjectAdapter());
  await Hive.openBox<Project>('projes');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'nazanin'),
      onInit: () async {
        Get.find<TaskAndPRojBox>().getTaskData();
        Get.find<TaskAndPRojBox>().getCatData();
        Get.find<TaskAndPRojBox>().getProjData();
        remindTimes();
        cacluteprogress();
        
        
      },
      debugShowCheckedModeBanner: false,
      initialBinding: MyBindigs(),
      getPages: pages,
      defaultTransition: Transition.fadeIn,
      title: "Task Manengment",
      // home: MainViewPage(key: key,),
      home: SplashScreen());
    
  }
}
