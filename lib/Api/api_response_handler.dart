// import 'dart:convert';
// import 'dart:developer';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mymandiwarehouse/screen/authentication/login_page.dart';
// import 'package:http/http.dart' as http;
// import 'package:mymandiwarehouse/widgets/customToaster.dart';
//
// class ApiResponseHandler{
//   var box = GetStorage();
//
//
//   /// with loading button
//   ResponseHandler({response,model,btn}){
//
//       if (response.statusCode == 401) {
//         var responseBody = json.decode(response.body);
//         getErrorToaster(responseBody!["message"]);
//         Get.offAll(()=>LoginScreen());
//       }
//       else if (response.statusCode == 400) {
//         var responseBody = json.decode(response.body);
//         getErrorToaster("${responseBody!["message"]}");
//         return btn.stop();
//       }
//       else if (response.statusCode == 500) {
//         var responseBody = json.decode(response.body);
//         getErrorToaster("${responseBody!["message"]}");
//         return btn.stop();
//       }
//
//   }
//
//   /// without loading button
//
//   ResponseWithoutLoadingHandler({response,model}){
//
//     if (response.statusCode == 401) {
//       var responseBody = json.decode(response.body);
//       getErrorToaster("${responseBody!["message"]}");
//       Get.offAll(()=>LoginScreen());
//     }
//     else if (response.statusCode == 400) {
//       var responseBody = json.decode(response.body);
//       getErrorToaster("${responseBody!["message"]}");
//       return getErrorToaster("${responseBody!["message"]}");
//     }
//     else if (response.statusCode == 500) {
//       var responseBody = json.decode(response.body);
//       getErrorToaster("${responseBody!["message"]}");
//       return getErrorToaster("${responseBody!["message"]}");
//     }
//
//   }
//
//
//   ResponsePostHandler({apiUrl,data,btn,})async{
//
//
//     final response = await http.post(Uri.parse(apiUrl.toString()),
//       headers: {
//         "Content-Type": "text/plain",
//         "access-Token": box.read("authToken"),
//       },
//       body: jsonEncode(data),
//     );
//
//     log("message value"+response.body);
//     if(response.statusCode==200){
//
//       log("message ${response.body}");
//       return response;
//
//
//     }
//     else if (response.statusCode == 401) {
//       var responseBody = json.decode(response.body);
//       getErrorToaster("${responseBody!["message"]}");
//       Get.offAll(()=>LoginScreen());
//     }
//     else if (response.statusCode == 400) {
//       var responseBody = json.decode(response.body);
//       getErrorToaster("${responseBody!["message"]}");
//       return btn==""?true:btn.stop();
//     }
//     else if (response.statusCode == 404) {
//       var responseBody = json.decode(response.body);
//       getErrorToaster("${responseBody!["message"]}");
//       return btn==""?true:btn.stop();
//     }
//     else if (response.statusCode == 500) {
//       var responseBody = json.decode(response.body);
//       getErrorToaster("${responseBody!["message"]}");
//       return btn==""?true:btn.stop();
//     }
//
//   }
//
//
//
//
//
//
// }