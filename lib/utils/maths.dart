import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';

void remindTimes() {
  Get.find<TaskAndPRojBox>().remindTime.clear();
  for (var values in Get.find<TaskAndPRojBox>().projList) {
    int monde = 0;
    int correntendMonth = 0;
    String starttime = values.startTime;
    String endtime = values.endTime;
    int startMonth = int.parse(starttime.split('/')[1]);
    int endMonth = int.parse(endtime.split('/')[1]);

    int startday = int.parse(starttime.split('/')[2]);
    int endday = int.parse(endtime.split('/')[2]);

    if (endMonth > startMonth) {
      correntendMonth = endMonth - startMonth;

      monde = monde + (correntendMonth * 30);
      if (endday > startday) {
        monde = endday - startday;
      } else if (endday < startday) {
        monde = startday - endday;
      }
    } else {
      monde = endday - startday;
    }
    Get.find<TaskAndPRojBox>().remindTime.add(monde);
  }
}

dynamic caculateTasks() {
  if (Get.find<TaskAndPRojBox>().taskList.isNotEmpty) {
    for (var k = 0; k < Get.find<TaskAndPRojBox>().projList.length; k++) {
      Get.find<TaskAndPRojBox>().projList[k].tasks.clear();
      Get.find<TaskAndPRojBox>().projList[k].completetTasks.clear();
    }

    for (var i = 0; i < Get.find<TaskAndPRojBox>().projList.length; i++) {
      for (var j = 0; j < Get.find<TaskAndPRojBox>().taskList.length; j++) {
        if (Get.find<TaskAndPRojBox>().taskList[j].projectRelate ==
            Get.find<TaskAndPRojBox>().projList[i].title) {
          Get.find<TaskAndPRojBox>()
              .projList[i]
              .tasks
              .add(Get.find<TaskAndPRojBox>().taskList[j].title);
        }
      }
    }
  }
}

void cacluteprogress() async {
  await caculateTasks();


if (Get.find<TaskAndPRojBox>().taskList.isNotEmpty){
    var resuilt;
  for (var element in Get.find<TaskAndPRojBox>().projList) {
    for (var value in element.tasks) {
      for (var task in Get.find<TaskAndPRojBox>().taskList) {
        if (value == task.title && task.status == true) {
          element.completetTasks.add(task.title);
        }
      }
    }
  }

  for (var element in Get.find<TaskAndPRojBox>().projList) {
    resuilt = 100 -
        ((element.tasks.length - element.completetTasks.length) * 100) /
            element.tasks.length;
    print(resuilt);
    element.progress = resuilt.toInt();
  }}
}
