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
  if(Get.find<TaskAndPRojBox>().taskList.isNotEmpty){
    for (var k = 0; k < Get.find<TaskAndPRojBox>().projList.length; k++) {
    Get.find<TaskAndPRojBox>().projList[k].tasks.clear();
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
  await  caculateTasks();


int full=Get.find<TaskAndPRojBox>().taskList.length;
int maybesucsecc=Get.find<TaskAndPRojBox>().taskList.length;
double multi=0.0;
double substact=0.0;
double result=0.0;




if(Get.find<TaskAndPRojBox>().taskList.isNotEmpty){

for (var i = 0; i < Get.find<TaskAndPRojBox>().projList.length; i++) {
  
  for(int k=0;k<Get.find<TaskAndPRojBox>().taskList.length;k++){

    
    
    
    if(Get.find<TaskAndPRojBox>().projList[i].tasks[k]==Get.find<TaskAndPRojBox>().taskList[k].title && Get.find<TaskAndPRojBox>().taskList[k].status == true){
      print("inja");
      maybesucsecc=maybesucsecc-1;
    }
        multi=maybesucsecc*100;
    substact=multi/full;
    result=100-substact;
  }
  
      // for (var k = 0; k < Get.find<TaskAndPRojBox>().taskList.length; k++) {
        
         
      //   if (Get.find<TaskAndPRojBox>().projList[i].tasks[i] ==
      //           Get.find<TaskAndPRojBox>().taskList[k].title &&
      //       Get.find<TaskAndPRojBox>().taskList[k].status == true) {
              
      //         Get.find<TaskAndPRojBox>().projList[i].tasks.remove(Get.find<TaskAndPRojBox>().taskList[k].title);


             
      //       }
      // }
    
  }
}
print(result);
  


 
}
