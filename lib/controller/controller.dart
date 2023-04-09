import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taskmannager/models/catogeryModel.dart';
import 'package:taskmannager/models/projModel.dart';
import 'package:taskmannager/models/taskModel.dart';
import 'package:taskmannager/utils/date_timeUtil.dart' as date_util;

class PrefController {
  static SharedPreferences? pref;

  static Future<bool> letsynch() async {
    pref = await SharedPreferences.getInstance();

    return pref!.getBool('isActive') ?? false;
  }
}

class BottomNavigatenController extends GetxController {
  var activeindex = 0.obs;
}

class TimeAndDateController extends GetxController {
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();

  TextEditingController controller = TextEditingController();
  String displayDay = "";

  @override
  void onInit() {
    displayDay = DateTime.now().day.toString();
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 75.0 * currentDateTime.day);
    super.onInit();
  }
}

class TaskController extends GetxController {
  String year = '';
  String month = '';
  String day = '';
  String defuiltTime = "تاریخ";
  var items = ["پروژه مربوطه را وارد کنید", "بدون پروژه"];
  late String displayvalue;
  @override
  void onInit() {
    

    displayvalue = items[0];
    super.onInit();
  }

  void itemadd() {
    items.clear();
    items.add("پروژه مربوطه را وارد کنید");
    items.add('بدون پروژه');
    if (Get.find<TaskAndPRojBox>().projList.isNotEmpty) {
      for (var value in Get.find<TaskAndPRojBox>().projList) {
        items.add(value.title);
      }
    }
  }
}

class FieildControllers extends GetxController {
  //task Controller
  TextEditingController taskFieldController = TextEditingController();
  TextEditingController noteFieldController = TextEditingController();
   String dateController='';
   String relatedProject='بدون پروژه';
  bool status = false;

  //Cat Controllers
  TextEditingController categoryFieldController = TextEditingController();

  //Project Controller

  TextEditingController titleController = TextEditingController();
  TextEditingController despController = TextEditingController();
  String startTime = "${DateTime.now().year.toString()}/${DateTime.now().month.toString()}/${DateTime.now().day.toString()}";
  String? endTime;
  List categorys = [];
  TextEditingController progress=TextEditingController(text: "0");

  //current index
  int currentindex=0;
  
  //bools
  bool isEditing=false;

  //Searchbar Controller
  TextEditingController searchbarController=TextEditingController();

}

class TaskAndPRojBox extends GetxController {
  Box<TaskModel> hivebox = Hive.box<TaskModel>('tasks');
  List<TaskModel> taskList = <TaskModel>[].obs;

  Box<CategoryModel> catBox = Hive.box<CategoryModel>('cat');
  List<CategoryModel> catList = [];

 

  Box<Project> projbox = Hive.box<Project>('projes');
  List<Project> projList = [];

  List<int> remindTime=[];

  void getTaskData() {
    taskList.clear();
    for (var values in hivebox.values) {
      taskList.add(values);
    }
  }



  void getCatData() {
    catList.clear();
    for (var value in catBox.values) {
      catList.add(value);
    }
  }

  void getProjData() {
    projList.clear();
    for (var value in projbox.values) {
      projList.add(value);
    } 

    
  }
  




  @override
  void onClose() {
    Hive.close();
    super.onClose();
  }
}
