import 'package:flutter/material.dart';
import 'package:islami/modules/splash/screens/splash_screen.dart';

class SplashDesign extends StatefulWidget {
  const SplashDesign({super.key});

  @override
  State<SplashDesign> createState() => _SplashDesignState();
}

class _SplashDesignState extends State<SplashDesign> {
 
  
  @override
 void initState() {
    Future.delayed(Duration(seconds: 5)
    ,(){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
            return SplashScreen();
          },));
        });

    super.initState();
  
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Image.asset("assets/images/background.png",fit:.fill,),
          SafeArea(
            child: Column(
              children: [
                Image.asset("assets/images/Mosque-01.png"),
                Expanded(child: Image.asset("assets/logo/islami_logo.png",width: 150,)),
               Center(child: Image.asset("assets/logo/route_logo.png",width: 150,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
