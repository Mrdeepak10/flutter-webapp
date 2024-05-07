import 'dart:convert';
import 'dart:developer';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart'as http;
import 'package:mandiweb/Api/api_list.dart';
import 'package:mandiweb/model/home/home_model.dart';
import 'package:mandiweb/model/product_model/product_details.dart' as Prod;
import 'package:mandiweb/model/retail_model/retails_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../model/category_model/category_model.dart';
import '../../model/order_history/order_history.dart';
import '../../model/product_model/product_brand_model.dart';
import '../../model/product_model/product_details_model.dart';
import '../../widgets/custom_toaster.dart';

class HomeController extends GetxController{

  // final local=Get.put(LocalDataController());
  RxList<Prod.Products> itemList = <Prod.Products>[].obs;
  RxList itemId=[].obs;
  var itemSum="".obs;
  var itemMrp="".obs;
  var itemGst=''.obs;
  var discountAmount="".obs;
  RxBool itemFound = false.obs;
  var api=ApiUrl();
  RxList OrderHistoryList=RxList.empty();

  RxBool loading=false.obs;
  RxList searchHistory = [].obs;
  static const historyKey = 'search_history';
  Rx<TextEditingController> searchController = TextEditingController().obs;
  Rx<TextEditingController> productSearchController = TextEditingController().obs;
  var Search = "".obs;
  var brand="".obs;
  var brandName="".obs;
  RxBool isLoading = false.obs;
  RxList productSearch = [].obs;
  RxList productSearchList = [].obs;
  var searchCategoryId = "".obs;
  RxList productBrandSearchList = [].obs;
  RxList seeProductSearchList = [].obs;
  var see="".obs;
  var searchCat = "".obs;
  var cat="".obs;
  var catName="".obs;
  RxList catProductSearchList = [].obs;

  @override
  void onInit() {
  super.onInit();
  print('Controller initialized');
  itemLoad();
  //deleteCacheDir();
  debounce(cat, (_) => catSearch());
  debounce(Search, (_) => search());
  debounce(see, (_) => seeAllSearch());
  debounce(brand, (_) => brandSearch(brand:brandName ));
  }


  // Future<void> deleteCacheDir() async {
  //   final cacheDir = await getTemporaryDirectory();
  //   if (cacheDir.existsSync()) {
  //     cacheDir.deleteSync(recursive: true);}
  // final appDir = await getApplicationSupportDirectory();
  // if (appDir.existsSync()) {
  // appDir.deleteSync(recursive: true);}
  // }

  /// Search
  Future search() async {
    try {
      bool isConnected = true;// await checkInternetConnection();
      if (isConnected) {
        isLoading.value = true;
        productSearchList.clear();
        if (productSearchController.value.text.toString().isNotEmpty) {
          onSearch(productSearchController.value.text);
          var response = await http.get(
            Uri.parse(api.searchApi +"?search="+
                productSearchController.value.text +
                "&warehouse_id=${api.localStorage.read("warehouseId")}"),
            headers: api.headerAuth,
          );

          print(response.body);
          if (response.statusCode == 200) {
            productSearchList.clear();
            isLoading.value = false;
            var body = jsonDecode(response.body);
            if (body['products'] != null) {
              productSearchList.addAll(body['products']);
            }

            return ProductDetailsModel.fromJson(jsonDecode(response.body));
          } else {
            var body=jsonDecode(response.body);
            customToast(type: "error", message: body['message'].toString());
          }
        }
        else{
          isLoading.value = false;
        }

      }
      // else{
      //
      // }
    } catch (e) {

    }
  }


  ///seeall
  Future seeAllSearch() async {
    try {
      bool isConnected = true;// await checkInternetConnection();
      if (isConnected) {
        isLoading.value = true;
        seeProductSearchList.clear();
        productSearchList.clear();
        if (productSearchController.value.text.toString().isNotEmpty) {
          onSearch(productSearchController.value.text);
          var response = await http.get(
            Uri.parse(api.searchApi +"?search="+
                productSearchController.value.text +
                "&warehouse_id=${api.localStorage.read("warehouseId")}"),
            headers: api.headerAuth,
          );

          print(response.body);
          if (response.statusCode == 200) {
            productSearchList.clear();
            isLoading.value = false;
            var body = jsonDecode(response.body);
            if (body['products'] != null) {
              productSearchList.addAll(body['products']);
            }

            return ProductDetailsModel.fromJson(jsonDecode(response.body));
          } else {
            var body=jsonDecode(response.body);
            customToast(type: "error", message: body['message'].toString() );
          }
        }

        else if (productSearchController.value.text.toString().isEmpty) {
          onSearch(productSearchController.value.text);
          var response = await http.get(
            Uri.parse(api.seeAllApi +//"?product_type=b2c"+
                "?warehouse_id=${api.localStorage.read("warehouseId")}"),
            headers: api.headerAuth,
          );

          log(response.body);
          if (response.statusCode == 200) {
            seeProductSearchList.clear();
            isLoading.value = false;
            var body = jsonDecode(response.body);
            if (body['products'] != null) {
              seeProductSearchList.addAll(body['products']);
            }

            return ProductDetailsModel.fromJson(jsonDecode(response.body));
          } else {
            var body=jsonDecode(response.body);
            customToast(type: "error", message: body['message'].toString());
          }
        }
        else{
          isLoading.value = false;
        }

      }

    } catch (e) {

    }
  }

  /// brand
  Future brandSearch({brand}) async {
    try {
      bool isConnected = true;// await checkInternetConnection();
      if (isConnected) {
        isLoading.value = true;
         productBrandSearchList.clear();
        productSearchList.clear();
        if (productSearchController.value.text.toString().isNotEmpty) {
          onSearch(productSearchController.value.text);
          var response = await http.get(
            Uri.parse(api.searchApi +"?search="+
                productSearchController.value.text +
                "&warehouse_id=${api.localStorage.read("warehouseId")}"),
             headers: api.headerAuth,
          );

          print(response.body);
          if (response.statusCode == 200) {
            productSearchList.clear();
            isLoading.value = false;
            var body = jsonDecode(response.body);
            if (body['products'] != null) {
              productSearchList.addAll(body['products']);
            }

            return ProductDetailsModel.fromJson(jsonDecode(response.body));
          } else {
            var body=jsonDecode(response.body);
            customToast(type: "error", message: body['message'].toString());
          }
        }
        else if (productSearchController.value.text.toString().isEmpty) {
          onSearch(productSearchController.value.text);
          var response = await http.get(
            Uri.parse(api.brandProductApi +"?product_type=b2c"+
                "&warehouse_id=${api.localStorage.read("warehouseId")}"+"&brand=$brand"),
            headers: api.headerAuth,
          );

          print("brand product 1"+api.brandProductApi +"?product_type="+
              brand +
              "&warehouse_id=${api.localStorage.read("warehouseId")}");
          print("brand product 1"+response.body);
          if (response.statusCode == 200) {
            productBrandSearchList.clear();
            isLoading.value = false;
            var body = jsonDecode(response.body);
            if (body['products'] != null) {
              productBrandSearchList.addAll(body['products']);
            }

            return ProductDetailsModel.fromJson(jsonDecode(response.body));
          } else {
            var body=jsonDecode(response.body);
            customToast(type: "error", message: body['message'].toString() );
          }
        }
        else{
          isLoading.value = false;
        }

      }

    } catch (e) {

    }
  }


  /// cat
  Future catSearch({catId}) async {
    try {
      bool isConnected = true;// await checkInternetConnection();
      if (isConnected) {
        isLoading.value = true;
        catProductSearchList.clear();
        productSearchList.clear();
        if (productSearchController.value.text.toString().isNotEmpty) {
          onSearch(productSearchController.value.text);
          var response = await http.get(
            Uri.parse(api.searchApi +"?search="+
                productSearchController.value.text +
                "&warehouse_id=${api.localStorage.read("warehouseId")}"),
            headers: api.headerAuth,
          );

          print(response.body);
          if (response.statusCode == 200) {
            productSearchList.clear();
            isLoading.value = false;
            var body = jsonDecode(response.body);
            if (body['products'] != null) {
              productSearchList.addAll(body['products']);
            }

            return ProductDetailsModel.fromJson(jsonDecode(response.body));
          } else {
            var body=jsonDecode(response.body);
            customToast(type: "error", message: body['message'].toString());
          }
        }
        else if (productSearchController.value.text.toString().isEmpty) {
          //onSearch(productSearchController.value.text);
          var response = await http.get(
            Uri.parse(api.seeAllApi +
                "?warehouse_id=${api.localStorage.read("warehouseId")}"+"&category=${catId}"
            ),
            headers: api.headerAuth,
          );

          print("category product 1"+api.seeAllApi +
              "&warehouse_id=${api.localStorage.read("warehouseId")}"+"&category=$catId");
          print("category product 1"+response.body);
          if (response.statusCode == 200) {
            catProductSearchList.clear();
            isLoading.value = false;
            var body = jsonDecode(response.body);
            if (body['products'] != null) {
              catProductSearchList.addAll(body['products']);
            }

            return ProductDetailsModel.fromJson(jsonDecode(response.body));
          } else {
            var body=jsonDecode(response.body);
            customToast(type: "error", message: body['message'].toString());
          }
        }
        else{
          isLoading.value = false;
        }

      }

    } catch (e) {

    }
  }

  void onSearch(String query) {
    addToSearchHistory(query);
    loadSearchHistory();
  }

  Future<void> loadSearchHistory() async {
    final history = await getSearchHistory();
    //setState(() {
    searchHistory.value = history;
    //});
  }

  Future<List<SearchHistoryItem>> getSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList(historyKey) ?? [];
    return history.map((query) => SearchHistoryItem(query)).toList();
  }

  Future<void>addToSearchHistory(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList(historyKey) ?? [];
    history.insert(0, query);
    prefs.setStringList(historyKey, history);
  }

  Future<void>clearSearchHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(historyKey);
    loadSearchHistory();

  }


   itemLoad() async{
    if(GetStorage().read('productList')==null){

      itemList.clear();
      itemId.clear();
    }else{

      List savedProductListJson = api.localStorage.read('productList');
      itemList.assignAll(savedProductListJson.map((jsonString) => Prod.Products.fromJson(Map<String, dynamic>.from(json.decode(jsonString)))).toList());
      double totalPrice = itemList.fold(0, (prev, product) => prev + (product.listPrice as double));
      double totalPrice1 = itemList.fold(0, (prev, product) => prev + (product.listPrice as double));
      double totalGst = itemList.fold(0, (prev, product) => prev + (product.taxAmount as double));
      itemSum.value=totalPrice.toString();
      itemMrp.value=totalPrice1.toString();
      itemGst.value=totalGst.toString();
      discountAmount.value=(double.parse(totalPrice1.toString())-double.parse(totalPrice.toString())).toStringAsFixed(2);
      itemId.value=itemList.map<dynamic>((product) => product.id).toList();
    }


  }

  RxBool LoadingHome=false.obs;

   getHome()async {
    // Map<String,dynamic> data={
    //   "warehouse_id":1
    // };
    LoadingHome.value=true;
    var response = await http.get(
        Uri.parse(api.homeApi+"?warehouse_id=${api.localStorage.read("warehouseId")}"),
        headers: api.header,
    );

    if (response.statusCode == 200) {

      LoadingHome.value=false;
     return HomeModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
      LoadingHome.value=false;
    }

  }


  getBrand()async {
    var response = await http.get(
      Uri.parse(api.brandAPI),
      headers: api.header,
    );

   // log("b2b" +api.brandAPI);
   // print("b2b" +response.body);
    if (response.statusCode == 200) {

      return BrandModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
    }

  }

  getCCategory()async {
    // Map<String,dynamic> data={
    //   "warehouse_id":1
    // };
    var response = await http.get(
      Uri.parse(api.categoryApi+"?warehouse_id=${api.localStorage.read("warehouseId")}"),
      headers: api.header,
    );

   // log(response.body);
    if (response.statusCode == 200) {

       return CategoryModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
    }

  }



  getProductDetails({id})async {
    // Map<String,dynamic> data={
    //   "warehouse_id":1
    // };
    var response = await http.get(
      Uri.parse(api.productDetailsApi+id.toString()+"?warehouse_id=${api.localStorage.read("warehouseId")}"),
      headers: api.header,
    );

   // log(api.productDetailsApi+id.toString());
    log("b2b" +response.body);
    if (response.statusCode == 200) {

       return ProductDetailsModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
    }

  }



  Future orderHistory() async {
    try{
      Map<String, dynamic> data = {
        "user_type": "customer"
      };

      http.Response response = await http.post(Uri.parse(api.saleHistoryb2cApi),
          headers: {
            "Content-Type": "text/plain",
            "access-Token": api.localStorage.read("authToken"),
          },
          body: jsonEncode(data)
      );


      print(api.localStorage.read("authToken"));
      log(response.body);
      print(response.body);
      print(api.saleHistoryb2cApi);

      if (response.statusCode == 200) {

        // OrderHistoryList.clear();
        // loading.value = false;
        // var body=jsonDecode(response.body);
        //
        //
        //
        // if (body["result"]!=null) {
        //   loading.value = false;
        //
        //   OrderHistoryList.addAll(body["result"]);
        // }
       return OrderHistoryModel.fromJson(jsonDecode(response.body));
       //  return OrderHistoryList;

      }
      else{
        var body=jsonDecode(response.body);
        customToast(type: "error", message: body['message'].toString());
      }
    }catch (e) {
      //getErrorToaster(" $e Error Occured");
    }

  }


  getRetailsAddress({id})async {
    // Map<String,dynamic> data={
    //   "warehouse_id":1
    // };
    LoadingHome.value=true;
    var response = await http.get(
      Uri.parse(api.retailsApi+"$id"),
      headers: api.header,
    );

    log("customer "+response.body);
    log("customer "+response.body);

    if (response.statusCode == 200) {

      LoadingHome.value=false;
      return RetailsModel.fromJson(jsonDecode(response.body));
    }
    else{
      var body=jsonDecode(response.body);
      customToast(type: "error", message: body['message'].toString());
      LoadingHome.value=false;
    }

  }

}


class SearchHistoryItem {
  final String query;

  SearchHistoryItem(this.query);
}


// class Debouncer {
//   VoidCallback? _callback;
//   Timer? _timer;
//
//   void run(VoidCallback action) {
//     if (_timer != null) {
//       _timer!.cancel();
//     }
//     _timer = Timer(_debounceDuration, action);
//   }
// }