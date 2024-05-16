import 'package:flutter/material.dart';
import 'package:systemic_altruism/screens/Slideshow.dart';
import 'package:systemic_altruism/screens/animation_test.dart';
import 'package:systemic_altruism/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 99, 69, 59),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.brown[300],
              ),
              width: 500,
              height: 500,
              child: SplashScreen(),
            ),
          ),
        ),
      ),
    );
  }
}
