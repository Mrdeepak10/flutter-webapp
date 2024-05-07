import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mandiweb/screen/about_me/about_me.dart';
import 'package:mandiweb/screen/auth/login.dart';
import 'package:mandiweb/screen/auth/otp.dart';
import 'package:mandiweb/screen/cart/cart.dart';
import 'package:mandiweb/screen/homescreen/home_screen.dart';
import 'package:mandiweb/screen/order_history/order_history.dart';
import 'package:mandiweb/screen/order_history/order_history_details.dart';
import 'package:mandiweb/widgets/splash_screen.dart';


import '../widgets/root.dart';
import 'routes.dart';

class Pages{
  static List<GetPage> pageList=[
    GetPage(name: '/', page: () => SplashScreen(key: UniqueKey())),
    GetPage(name: Routes.ROOT,page:()=> Root()),
    GetPage(name: Routes.splashScreen,page:()=> SplashScreen(key: UniqueKey()),),
    //GetPage(name: Routes.ONBOARDING,page:()=>const OnBoardingScreen()),
    GetPage(name: Routes.HOME,page:()=> HomeScreen(key: UniqueKey())),
    GetPage(name: Routes.loginScreen,page:()=> LoginScreen(key: UniqueKey()),),
    GetPage(name: Routes.otpScreen,page:()=> OtpScreen(key: UniqueKey()),),
    GetPage(name: Routes.cartScreen,page:()=> CartScreen(key: UniqueKey()),),
    GetPage(name: Routes.orderHistory,page:()=> OrderHistory(key: UniqueKey()),),
    GetPage(name: Routes.orderHistoryDetails,page:()=> OrderHistoryDetails(key: UniqueKey()),),
    GetPage(name: Routes.aboutUs,page:()=> AboutUs(key: UniqueKey()),),
  ];
}

// class RouteMiddleware extends GetMiddleware{
//
//
//   @override
//   RouteSettings ? redirect(String ?route){
//     return RouteSettings(name: Routes.homeScreen);
//   }
//
//
// }




