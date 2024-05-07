import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import 'package:mandiweb/screen/cart/cart.dart';
import '../../Api/api_list.dart';
import '../../screen/auth/otp.dart';
import '../../screen/homescreen/home_screen.dart';
import '../../widgets/custom_toaster.dart';

class AuthController extends GetxController{


  final homeController =Get.put(HomeController());



  var apiUrl=ApiUrl();
  RxString countryName = ''.obs;
  RxString countryCode = 'IN'.obs;
  RxString phoneNumber = ''.obs;

  Future login({mobile,username}) async {
    try{
      Map<String, String> data={
        "mobile": mobile,
        "name":username
      };
      var response = await http.post(
        Uri.parse(apiUrl.otpApi),
        headers: apiUrl.header,
        body: jsonEncode(data),
      );
      log(data.toString());
      log(response.body);
      if (response.statusCode==200) {

        EasyLoading.dismiss();
        Get.to(()=> OtpScreen(),arguments: [mobile,username]);


      }
      else{
        var body=jsonDecode(response.body);
        customToast(type: "error", message: body['message'].toString());
      }

    } catch (e) {
      //getErrorToaster("$e Error");
    }

  }




  Future otpVerify({mobile,otp,userName}) async {
    try{
     // log(apiUrl.localStorage.read("device_Token").toString());
      Map<String, String> data={
        "mobile": mobile,
        "otp":otp,
        "name":userName,
        //"fcm_token":apiUrl.localStorage.read("device_Token"),
      };

      log(data.toString());
      var response = await http.post(
        Uri.parse(apiUrl.loginApi),
        headers: apiUrl.header,
        body: jsonEncode(data),
      );

      log("login details "+response.body);
      if (response.statusCode==200) {
        EasyLoading.dismiss();
        var details= jsonDecode(response.body);
        apiUrl.localStorage.write("authToken", details['access_token']);
        apiUrl.localStorage.write("partner_id", details['partner_id']);
        apiUrl.localStorage.write("wmName", details['warehouse_name']);
        apiUrl.localStorage.write("email", details['email']);
        apiUrl.localStorage.write("name", details['name']);
        apiUrl.localStorage.write("uid", details["uid"]);
        apiUrl.localStorage.write("usertype", details['usertype']);
        apiUrl.localStorage.write("wmId",details["warehouse_id"]);
        if(homeController.itemList.isEmpty) {
          Get.offAll(() => HomeScreen());
        }
        else{
          Get.offAll(() => CartScreen());
          // Get.offAll(() => Ca());
        }

      }
      else{
        var body=jsonDecode(response.body);
        customToast(type: "error", message: body['message'].toString());
      }
    } catch (e) {
      //getErrorToaster("$e Error");
    }

  }

}