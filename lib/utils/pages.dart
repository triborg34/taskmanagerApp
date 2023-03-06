import 'package:get/get.dart';
import 'package:taskmannager/screens/MainViewPage.dart';
import 'package:taskmannager/screens/newProje_screen.dart';
import 'package:taskmannager/screens/newtask_screen.dart';

import 'package:taskmannager/screens/onboarding.dart';

var pages = [
  GetPage(name: '/onbarding', page: () => OnBoardingScreen()),
  GetPage(
    name: '/home',
    page: (() => MainViewPage()),
  ),
  GetPage(name: '/newtask', page: (() => NewTask())),
  GetPage(
    name: '/newproj',
    page: () => NewProjectScreen(),
  )
];
