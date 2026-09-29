import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../layout/screens/layout_screen.dart';
import 'introscreen1.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 3),() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return Introscreen1();
      },));
    },);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Center(child: Image.asset("assets/logo/app_logo.png"),)),
            Center(child: Image.asset("assets/logo/route_logo.png",width: 244,),),

          ],
        ),
      ),
    );
  }
}
