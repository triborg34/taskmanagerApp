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
      
      title: Text.rich(textAlign: TextAlign.center,TextSpan(children: [
        TextSpan(
            text: 'TacTus\n',
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
                wordSpacing: 5)),
                TextSpan(text: "A Task And Project Management",style: TextStyle(fontSize: 18,color: Colors.green.shade400,fontWeight: FontWeight.bold))
      ])),
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
