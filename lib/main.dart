import 'package:flutter/material.dart';


import 'modules/layout/screens/layout_screen.dart';
import 'modules/splash/screens/introscreen1.dart';
import 'modules/splash/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/LayoutScreen': (context) => const LayoutScreen(),
        '/intro': (context) => const Introscreen1(),
      },
      home: SplashScreen(),
    );
  }
}

