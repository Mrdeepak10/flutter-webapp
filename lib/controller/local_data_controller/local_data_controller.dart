

import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:mandiweb/model/product_model/product_details.dart' as Prod;
import 'package:get/get.dart';

import '../../Api/api_list.dart';

class LocalDataController extends GetxController {

  RxList<Prod.Products> itemList = <Prod.Products>[].obs;
  RxList itemId=[].obs;
  var itemSum="".obs;
  RxBool itemFound = false.obs;
  var api=ApiUrl();

  @override
  void onInit() {
    super.onInit();
    // Called every time the controller is initialized.
    print('Controller initialized');
    itemLoad();
  }



  void itemLoad() async{
    if(GetStorage().read('productList')==null){

      itemList.clear();
      itemId.clear();
    }else{
      List savedProductListJson = GetStorage().read('productList');
      itemList.assignAll(savedProductListJson.map((jsonString) => Prod.Products.fromJson(Map<String, dynamic>.from(json.decode(jsonString)))).toList());
      double totalPrice = itemList.fold(0, (prev, product) => prev + (product.listPrice as double));
      itemSum.value=totalPrice.toString();
      itemId.value=itemList.map<dynamic>((product) => product.id).toList();
    }


  }

}