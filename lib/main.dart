import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mandiweb/constant/constant_color.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mandiweb/screen/homescreen/home_screen.dart';
import 'package:mandiweb/widgets/splash_screen.dart';
import 'package:url_strategy/url_strategy.dart';
import 'binding/initial_binding.dart';
import 'routes/page_list.dart';
import 'routes/routes.dart';
import 'package:get/get.dart';

void configureEasyLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.cubeGrid
    ..loadingStyle = EasyLoadingStyle.light
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..maskType = EasyLoadingMaskType.custom
    ..textColor = Colors.black
    ..maskColor = kPrimaryAppbarColor.withOpacity(0.5)
    ..userInteractions = false
    ..dismissOnTap = false;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  getData();

  runApp(const MyApp());

}

Future<void> initApp() async {
  setPathUrlStrategy();
  await GetStorage.init();
  await dotenv.load(fileName: ".env");
  if(GetStorage().read('warehouseId')==null || GetStorage().read('warehouseId').toString() =="null"){
    GetStorage().write('warehouseId', "3");
  }

  // if (!kIsWeb) {
  //   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  //     statusBarColor: Colors.transparent,
  //     statusBarBrightness: Platform.isAndroid ? Brightness.light : Brightness.dark,
  //     statusBarIconBrightness:
  //     Platform.isAndroid ? Brightness.light : Brightness.dark,
  //   ));
  // }
}

var retailName ="";
var warehouseId="";
var sellerId="";


class MyApp extends StatelessWidget {
  const MyApp({super.key});





 // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_ , child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
            scrollBehavior: MaterialScrollBehavior().copyWith(
               dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch, PointerDeviceKind.stylus, PointerDeviceKind.unknown},
             ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          //home: SplashScreen(),
          initialRoute: Routes.splashScreen,
          getPages: Pages.pageList,
          initialBinding: HomeBinding(),
          builder: EasyLoading.init(),
        );
      }
    );
  }



}

getData() async {
  String currentRoute = Uri.base.path; //Get.currentRoute;


  log("current path is "+Uri.base.toString());
  if (currentRoute.contains('/shop/')) {
    // Handle shop route
    setReferrerIdFromUri(Uri.parse(Uri.base.toString()));
  } else {
    // if (GetStorage().read("authToken") != null || GetStorage().read("warehouseId") != null) {
    //   await Future.delayed(const Duration(seconds: 2));
    //   if (Uri.base.path.toString() == '/homeScreen') {
    //     customToast(type: "error", message: "1 ${currentRoute.toString()}");
    //   }
    //   else{
    //     customToast(type: "error", message: "2 ${GetStorage().read("warehouseId").toString()}");
    //     customToast(type: "error", message: "2 ${GetStorage().read("authToken").toString()}");
    //     // customToast(type: "error", message: "12 ${Uri.base.path.toString()} ${Uri.base.path.toString() == '/homeScreen'} ${currentRoute.toString()}");
    //     Get.offAll(()=>LoginScreen());
    //
    //     // Get.offAllNamed(Routes.HOME);
    //   }
    // } else {
      await Future.delayed(const Duration(seconds: 2));
      Get.offAll(()=>HomeScreen());
      //Get.offAllNamed(Routes.HOME);
       //customToast(type: "error", message: "2 ${currentRoute.toString()}");
  //  }
  }
}

void setReferrerIdFromUri(Uri uri) async{

  final refId = uri.queryParameters["retailsName"];
  // log("1 "+refId.toString());
  final warehouseID = uri.queryParameters["warehouseId"];
  //log("2 "+warehouseID.toString());
  final sellerId = uri.queryParameters["sellerId"];
  //log("3 "+sellerId.toString());
  if (refId != null) {
    GetStorage().write('retailsName', refId.toString().replaceAll('_', " "));
  }
  if (warehouseID != null) {
    GetStorage().write('warehouseId', warehouseID);
  }
  if (sellerId != null) {
    GetStorage().write('sellerId', sellerId);
  }

  await Future.delayed(const Duration(seconds: 2));
  Get.offAll(()=>HomeScreen());
}