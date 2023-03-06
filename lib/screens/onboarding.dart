import 'package:flutter/material.dart';
import 'package:flutter_walkthrough_screen/flutter_walkthrough_screen.dart';
import 'package:get/get.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/screens/MainViewPage.dart';
import 'package:taskmannager/utils/onboardinglist.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return IntroScreen(
      pageRoute: MaterialPageRoute(
        builder: (context) {
          PrefController.pref?.setBool("isActive", true);
          return MainViewPage();
        },
      ),
      selectedDotColor: Colors.lightGreen,
      onbordingDataList: OnBardingList,
      colors: colors,
      nextButton: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: Icon(
          Icons.arrow_forward,
          color: Colors.white,
        ),
      ),
      lastButton: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: Icon(
          Icons.done,
          color: Colors.white,
        ),
      ),
      skipButton: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.lightGreen),
        child: Text(
          "پرش",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        onPressed: (() {
          PrefController.pref?.setBool("isActive", true);
          Get.offNamed('/home');
          // Get.toNamed('/onboarding');
        }),
      ),
    );
  }
}
