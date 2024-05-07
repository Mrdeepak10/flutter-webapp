import 'dart:convert';
import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mandiweb/Api/api_list.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';

import '../../model/order_history/order_history_details.dart';
import '../../model/payment/payment_response_model.dart';
import '../../widgets/custom_toaster.dart';

class CartController extends GetxController {
final homeController =Get.put(HomeController());
var orderId="".obs;
var api=ApiUrl();

  Future cart() async {
    try{

      List<Map<String, dynamic>> transformedList = homeController.itemList.map((product) {
        return {
          'product_id': int.parse(product.id.toString()),
          'qty': int.parse(product.stock.toString()), // Set the initial quantity as needed
        };
      }).toList();
      Map<String, dynamic> data={
        "warehouse_id":  api.localStorage.read("warehouseId"),
        "retailer_id":  api.localStorage.read("sellerId"),
        "order_lines": transformedList,
      };

      var response = await http.post(
        Uri.parse(api.createOrderApi),
        headers: api.headerAuth,
        body: jsonEncode(data),
      );
      print("cart update ${response.body}");
      log("cart is update"+response.body);
      if (response.statusCode==200) {
       // homeController.itemList.clear();
        var body=jsonDecode(response.body);
        print(body["order_id"].toString());
        orderId.value=body["order_id"].toString();
        print(orderId.value);
        log(body);

        EasyLoading.dismiss();

      }
      else{
        EasyLoading.dismiss();
        var body=jsonDecode(response.body);
        api.localStorage.remove("authToken");
        customToast(type: "error", message: body['message'].toString());
      }
    } catch (e) {
      //getErrorToaster("$e Error");
    }

  }


Future getCart({id}) async {
  try{

    http.Response response = await http.get(Uri.parse("${api.createOrderIdApi}$id"),
      headers: api.headerAuth,

    );
    print("getcart ${response.body}");

    if (response.statusCode == 200) {
      return PaymentResponseModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
    }



  }
  catch(e){

  }
}


Future getVerifyPayment({orderId,sign,paymentId}) async {
  try{

    Map<String,dynamic> data={
      "order_id":orderId,
      "signature":sign,
      "payment_id":paymentId
    };
    http.Response response = await http.post(Uri.parse("${api.verifyPaymentApi}"),
      headers: api.headerAuth,
      body: jsonEncode(data),

    );

    log("payment is"+response.body);

    if (response.statusCode == 200) {

      return PaymentResponseModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
    }



  }
  catch(e){

  }
}



Future orderDetail({id}) async {
  try{

    http.Response response = await http.get(Uri.parse("${api.saleOrderDetailsb2cApi}$id"),
      headers: api.headerAuth,

    );

    print("history "+response.body);
    if (response.statusCode == 200) {
      return OrderHistoryDetailsModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
    }



  }
  catch(e){

  }
}

}