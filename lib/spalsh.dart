import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:egyuide/modules/onboarding/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:lottie/lottie.dart';


class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Lottie.asset('assets/json/mysplash.json'),
        nextScreen: Onboard(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.leftToRightWithFade,
        backgroundColor: Color(0xff0e7886),
      splashIconSize: 1000,

    );

  }

}


