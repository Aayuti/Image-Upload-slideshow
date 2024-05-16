import 'dart:ui';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:page_transition/page_transition.dart';
import 'package:systemic_altruism/screens/animation_test.dart';
import 'package:systemic_altruism/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      backgroundColor: Color.fromARGB(255, 213, 187, 170),
      centered: true,
      duration: 3000,
      splashTransition: SplashTransition.fadeTransition,
      pageTransitionType: PageTransitionType.rightToLeft,
      animationDuration: Duration(seconds: 3),
      splash: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            child: const AnimationTest(),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 1.5, 0, 0),
            child: const Center(
              child: Text(
                "WELCOME TO FACE DETECTION APP!",
                style: TextStyle(
                  // letterSpacing: 1.0,
                  color: Color.fromARGB(255, 120, 79, 54),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontStyle: FontStyle.normal,
                ),
              ),
            ),
          ),
        ],
      ),
      nextScreen: HomeScreen(),
    );
  }
}
