import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:taskmannager/controller/controller.dart';
import 'package:taskmannager/screens/MainViewPage.dart';
import 'package:taskmannager/screens/onboarding.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logoWidth: 200,
      
      loaderColor: Colors.green,
      durationInSeconds: 3,
      title: Text("Task Manegment Cactus",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.green,wordSpacing: 5),),
      logo: Image.asset('assets/images/6.png'),
      navigator: FutureBuilder(
        future: PrefController.letsynch(),
        builder: (context, snapshot) {
          if (snapshot.data == false) {
            return OnBoardingScreen();
          } else {
            return MainViewPage();
          }
        },
      ),
    );
  }
}