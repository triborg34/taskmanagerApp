import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';

class MyBindigs extends Bindings {
  @override
  void dependencies() {
    Get.put(TaskAndPRojBox());
    Get.lazyPut(() => BottomNavigatenController());
    Get.put(TimeAndDateController());
    Get.put(TaskController());
    Get.put(FieildControllers());
  }
}
