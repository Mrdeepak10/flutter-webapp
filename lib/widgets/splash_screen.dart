import 'package:flutter/material.dart';
import 'package:mandiweb/constant/const_image.dart';
import 'package:mandiweb/constant/constant_color.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}


class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    // TODO: implement initState
    super.initState();


   }


  @override
  Widget build(BuildContext context) {
    return
      // WillPopScope(
      //   onWillPop: () async => false,
      PopScope(
      //forbidden swipe from userGestureInProgress
      canPop: false,
      child: Scaffold(
          backgroundColor: kPrimaryGreenColor,
          body: Center(
          child: Image.asset(Constimage.logo,
            height: 110,
            width: 258,
          ),
        ),
        ),
    );
  }
}
