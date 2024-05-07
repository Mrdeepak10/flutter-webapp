import 'dart:developer';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:mandiweb/constant/const_text.dart';
import 'package:mandiweb/controller/cart_controller/cart_controller.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import 'package:mandiweb/model/retail_model/retails_model.dart';
import 'package:mandiweb/screen/auth/login.dart';
import 'package:mandiweb/model/product_model/product_details.dart' as Prod;
import 'package:mandiweb/screen/order_history/order_history_details.dart';
import 'package:mandiweb/widgets/buttons/custom_fbuttons.dart';
import 'package:mandiweb/widgets/product/product_not_found.dart';
import 'package:razorpay_web/razorpay_web.dart';
import '../../constant/constant_color.dart';
import '../../model/payment/payment_response_model.dart';
import '../../widgets/buttons/add_qty_button.dart';
import '../../widgets/custom_toaster.dart';
import '../../widgets/product/product_list_view.dart';
import '../../widgets/text/price_text.dart';
import '../homescreen/home_screen.dart';
import '../product/product_details_screen.dart';

// bool isPreviousRouteExists() {
//   return Get.previousRoute != null;
// }

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final homeController = Get.put(HomeController());
  final cartController = Get.put(CartController());
  Razorpay _razorpay = Razorpay();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear(); // Removes all listeners
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(color: kwhitecolor, boxShadow: [
                    BoxShadow(
                      color: Colors.white.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ]),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            //  rou();
                            Get.to(() => HomeScreen());
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: kwhitecolor, //Color(0xffDBDBDB),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: kPrimaryGreenColor,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Delivery in 24hrs...",
                          style: kHeading16Boldblack500,
                        )
                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                homeController.itemList.isEmpty
                    ? ProductNotFound()
                    : Column(
                        children: [
                          Obx(()=>Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0, vertical: 8),
                              child: Container(
                                //height: 76.83,
                                width: Get.width,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 4, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffEEFDF8),
                                    border: Border.all(color: Color(0xff6D8A7B))),
                                child: Text(
                                  "You saved Rs ${(double.parse(homeController.itemMrp.toString()) - double.parse(homeController.itemSum.toString())).toStringAsFixed(2)} in your current order",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                      color: Color(0xff1D8248)),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),

                          //${homeController.discountAmount.toString()}
                          //${(double.parse(homeController.itemMrp.toString()) - double.parse(homeController.itemSum.toString())).toStringAsFixed(2)}
                          homeController.itemList.isEmpty
                              ? ProductNotFound()
                              : SizedBox(
                                  //height: MediaQuery.of(context).size.height * 0.85 ,
                                  child: SingleChildScrollView(
                                    child: ListView.separated(
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: homeController.itemList.length,
                                      dragStartBehavior:
                                          DragStartBehavior.start,
                                      itemBuilder: (context, index) {
                                        var singleData =
                                            homeController.itemList[index];
                                        Prod.Products pro = Prod.Products(
                                          id: singleData.id,
                                          image: singleData.image,
                                          uom: singleData.uom,
                                          name: singleData.name,
                                          actualPrice: singleData.actualPrice,
                                          stock: singleData.stock,
                                          mrp: singleData.actualDiscount,
                                          listPrice: singleData
                                              .actualPrice, //double.parse(singleData.actualPrice.toString()) * double.parse(singleData.stock.toString()),
                                          actualDiscount: singleData
                                              .actualDiscount, // double.parse(singleData.actualPrice.toString()) * double.parse(singleData.stock.toString()),
                                          taxAmount:  double.parse(singleData.actualGst.toString()),///double.parse(singleData.stock.toString()) * double.parse(singleData.taxAmount.toString()),
                                          actualGst: double.parse(singleData.actualGst.toString()),
                                        );

                                        return Stack(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 16,
                                                      vertical: 2),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(
                                                          .05,
                                                          .05,
                                                        ),
                                                        blurRadius: 2.0,
                                                        spreadRadius: 1.0,
                                                      ), //BoxShadow
                                                      BoxShadow(
                                                        color: Colors.white,
                                                        offset:
                                                            Offset(0.0, 0.0),
                                                        blurRadius: 0.0,
                                                        spreadRadius: 0.0,
                                                      ),
                                                    ],
                                                    color: Colors.white),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      height: 75,
                                                      width: 75,
                                                      child: Image.network(
                                                        singleData.image
                                                            .toString(),
                                                        fit: BoxFit.scaleDown,
                                                      ),
                                                    ),
                                                    //SizedBox(
                                                    //width:Get.width/4,
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top: 10,
                                                                left: 5),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          children: [
                                                            ///Name
                                                            GestureDetector(
                                                              onTap: () {
                                                                Get.to(
                                                                    () =>
                                                                        ProductDetailsPage(
                                                                          id: singleData
                                                                              .id!,
                                                                        ),
                                                                    arguments:
                                                                        singleData
                                                                            .id);
                                                              },
                                                              child: Text(
                                                                singleData.name
                                                                    .toString(),
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                softWrap: false,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Color(
                                                                      0xFF181725),
                                                                  fontSize: 12,
                                                                  fontFamily:
                                                                      'General Sans',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  height: 1.12,
                                                                  letterSpacing:
                                                                      0.10,
                                                                ),
                                                              ),
                                                            ),

                                                            const SizedBox(
                                                              height: 2,
                                                            ),

                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 2,
                                                                      bottom:
                                                                          2),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    "₹" +
                                                                        singleData
                                                                            .actualPrice
                                                                            .toString(),
                                                                    style: kHeading21Boldblack700.copyWith(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                  PriceDetailDiscountText(
                                                                    price: singleData
                                                                        .actualDiscount
                                                                        .toString(),
                                                                  ),
                                                                  const SizedBox(
                                                                    width: 5,
                                                                  ),
                                                                  Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              4),
                                                                      color: Color(
                                                                              0xffCF1C0C)
                                                                          .withOpacity(
                                                                              0.15),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: const EdgeInsets
                                                                          .all(
                                                                          4.0),
                                                                      child:
                                                                          Text(
                                                                        '${calculateDiscountPercentage(singleData.mrp!, singleData.listPrice!).floor()}% OFF',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Color(0xffCF1C0C),
                                                                          fontSize:
                                                                              11,
                                                                          fontFamily:
                                                                              'inter',
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),

                                                            QtyScreen(
                                                              productId:
                                                                  singleData.id
                                                                      .toString(),
                                                              products: pro,
                                                            ),
                                                            SizedBox(
                                                              height: 4,
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Padding(
                                                    //   padding: const EdgeInsets.only(right: 4.0),
                                                    //   child: QtyScreen( productId: singleData.id.toString(),products: pro,),
                                                    // ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder:
                                          (BuildContext context, int index) {
                                        return const SizedBox(
                                          height: 10,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Cancellation Policy :",
                                    style: TextStyle()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: kwhitecolor,
                              ),
                              child: Text(
                                  "Orders cannot be cancelled once they are packed for delivery."),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Billing Details :",
                                    style: TextStyle()),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: kwhitecolor,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Item :",
                                      ),
                                      const Spacer(),
                                      Obx(
                                        () => Text(
                                          '${homeController.itemList.length}', // You can replace this with your actual total
                                          style: kBody16black500.copyWith(
                                              fontSize: 12,
                                              color: kBlack,
                                              fontWeight: FontWeight
                                                  .w400), // TextStyle(fontSize: 14.0,color: kwhitecolor),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Your Saving",
                                      ),
                                      const Spacer(),
                                      Text(
                                        "₹${(double.parse(homeController.itemMrp.toString()) - double.parse(homeController.itemSum.toString())).toStringAsFixed(2)}",
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),

                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Subtotal",
                                      ),
                                      const Spacer(),
                                      Obx(() => Text(
                                        "\₹${(double.parse(homeController.itemSum.value)).toStringAsFixed(2)}",
                                        // "\₹${(double.parse(homeController.itemSum.value) - double.parse(homeController.itemGst.value)).toStringAsFixed(2)}",
                                      )),
                                      //Text("₹0",),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  // Row(
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceEvenly,
                                  //   children: [
                                  //     Text(
                                  //       "Tax/Gst",
                                  //     ),
                                  //     const Spacer(),
                                  //     Obx(() => Text(
                                  //           "\₹${double.parse(homeController.itemGst.value).toStringAsFixed(2)}",
                                  //         )),
                                  //     //Text("₹0",),
                                  //   ],
                                  // ),
                                  // SizedBox(
                                  //   height: 5,
                                  // ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Delivery Charges",
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "₹50",
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough,
                                            ),
                                          ),
                                          Text("Free",
                                              style: TextStyle(
                                                  color: kPrimaryGreenColor)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Handling Charges",
                                      ),
                                      const Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text("₹50",
                                              style: TextStyle(
                                                //color: kPrimaryGreenColor,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              )),
                                          Text("Free",
                                              style: TextStyle(
                                                  color: kPrimaryGreenColor)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Divider(
                                    height: 2,
                                    thickness: 1,
                                    color: kBlack,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Total",
                                      ),
                                      const Spacer(),
                                      Obx(() => Text(
                                            "\₹${double.parse(homeController.itemSum.value).toStringAsFixed(2)}",
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          homeController.api.localStorage
                              .read("sellerId")==null?SizedBox(): FutureBuilder(
                              future: homeController.getRetailsAddress(
                                  id: homeController.api.localStorage
                                      .read("sellerId")),
                              builder: (context, AsyncSnapshot snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  // If we got an error

                                  if (snapshot.hasError) {
                                    return Center(
                                      child: Text(
                                        '${snapshot.error} occurred',
                                        style: TextStyle(fontSize: 18),
                                      ),
                                    );

                                    // if we got our data
                                  } else if (snapshot.hasData) {
                                    // Extracting data from snapshot object
                                    RetailsModel? retails =
                                        snapshot.data as RetailsModel;

                                    return Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        //Text("${retails.result.toString() == '[]'} ${retails?.result?.isEmpty}"),
                                        retails.result == null ||
                                                retails.result.toString() ==
                                                    '[]'
                                            ? SizedBox()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              kPrimaryAppbarColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(8),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 23,
                                                                  top: 14),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .person),
                                                                      SizedBox(
                                                                        width:
                                                                            14.33,
                                                                      ),
                                                                      Text(
                                                                        "Retailer Details",
                                                                        //style: KBody16black500,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      width: 45,
                                                                      child:
                                                                          Divider(
                                                                        color:
                                                                            kPrimaryGreenColor,
                                                                        height:
                                                                            2,
                                                                      )),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      16,
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      "${retails.result?[0].name}", //$id (${getCustomerResponse?.result?.vendorCode})
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          3,
                                                                      // style: KBody15black600,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${retails.result?[0].address}",
                                                                            //style:
                                                                            // KBody16mediumblackcolor500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${retails.result?[0].mobile}",
                                                                            //style:
                                                                            // KBody16mediumblackcolor500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        homeController.api.localStorage
                                                    .read("name") ==
                                                null
                                            ? SizedBox()
                                            : Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          horizontal: 16),
                                                      child: Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          color:
                                                              kPrimaryAppbarColor,
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(8),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left: 23,
                                                                  top: 14),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Row(
                                                                    children: const [
                                                                      Icon(Icons
                                                                          .person),
                                                                      SizedBox(
                                                                        width:
                                                                            14.33,
                                                                      ),
                                                                      Text(
                                                                        "Customer Details",
                                                                        //style: KBody16black500,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                      width: 45,
                                                                      child:
                                                                          Divider(
                                                                        color:
                                                                            kPrimaryGreenColor,
                                                                        height:
                                                                            2,
                                                                      )),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .symmetric(
                                                                  horizontal:
                                                                      16,
                                                                ),
                                                                child: Column(
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    const SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                    Text(
                                                                      "${homeController.api.localStorage.read("name")}", //$id (${getCustomerResponse?.result?.vendorCode})
                                                                      softWrap:
                                                                          true,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          3,
                                                                      // style: KBody15black600,
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Text(
                                                                            "${homeController.api.localStorage.read("email")}",
                                                                            //style:
                                                                            // KBody16mediumblackcolor500,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                          10,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),

                                        // SizedBox(height: 10,),
                                        //
                                        //
                                        //
                                        SizedBox(
                                          height: 100,
                                        ),
                                      ],
                                    );
                                  }
                                }

                                // Displaying LoadingSpinner to indicate waiting state
                                return SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 1.3,
                                  child: const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                              }),
                        ],
                      ),

                // ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Obx(
        () => homeController.itemList.isEmpty
            ? SizedBox()
            : Padding(
                padding: const EdgeInsets.all(0.0),
                child: SafeArea(
                  child: Container(
                    height:
                        77, //155,// MediaQuery.of(context).size.height *//0.160,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: kwhitecolor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     //if (itemAvailableInCart)
                          //      Text("items :",
                          //          style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(color: kwhitecolor,fontSize: 14.0,),
                          //     ),
                          //     Obx(()=> Text(
                          //         '${homeController.itemList.length}', // You can replace this with your actual total
                          //         style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(fontSize: 14.0,color: kwhitecolor),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     //if (itemAvailableInCart)
                          //     Text("Delivery Charge :",
                          //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(color: kwhitecolor,fontSize: 14.0,),
                          //     ),
                          //      Text(
                          //       '0', // You can replace this with your actual total
                          //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(fontSize: 14.0,color: kwhitecolor),
                          //
                          //     ),
                          //   ],
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     //if (itemAvailableInCart)
                          //     Text("Handling Charge :",
                          //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(color: kwhitecolor,fontSize: 14.0,),
                          //     ),
                          //     Text(
                          //       '0', // You can replace this with your actual total
                          //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(fontSize: 14.0,color: kwhitecolor),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 4,),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: <Widget>[
                          //     Text("Total :",
                          //       style:kBody16black500.copyWith(color: kblue),
                          //     ),
                          //     Text(
                          //       '\₹${double.parse(homeController.itemSum.value).toStringAsFixed(2)}', // You can replace this with your actual total
                          //       style:kBody16black500.copyWith(color: kblue),// TextStyle(fontSize: 14.0,color: kwhitecolor),
                          //     ),
                          //   ],
                          // ),
                          // SizedBox(height: 4,),
                          CustomFButton(
                            onTap: () async {
                              final String? Token =
                                  GetStorage().read("authToken");

                              if(GetStorage().read("sellerId")==null ||GetStorage().read("sellerId")=="null"){
                                customToast(type: "info", message: "Thanks for completing the demo");
                              }else {
                                log(Token.toString());
                                log("${Token == null}");
                                log("${Token == "null"}");
                                if (Token == null) {
                                  log("message is empty");
                                  Get.to(() => LoginScreen());
                                } else
                                if (Token != "null" || Token.isNotEmpty) {
                                  EasyLoading.show(
                                    status: 'Placing order to Mymandi',
                                  );
                                  cartController.cart().whenComplete(() async {
                                    EasyLoading.show(
                                      status: 'loading payment screen',
                                    );

                                    PaymentResponseModel paymentResponse =
                                    await cartController.getCart(
                                        id: cartController.orderId.value);

                                    EasyLoading.dismiss();

                                    var options = {
                                      'key':
                                      'rzp_live_LbTrdAVlKwzH0F',
                                      //'zp_test_KIyTgacaYgVNzb',//'rzp_live_LbTrdAVlKwzH0F',
                                      'amount':
                                      '${paymentResponse.result?.amount}',
                                      //in the smallest currency sub-unit.
                                      'name': 'Mymandi',
                                      'order_id':
                                      '${paymentResponse.result?.id
                                          .toString()}',
                                      // Generate order_id using Orders API
                                      'description':
                                      '${paymentResponse.result?.notes
                                          .toString()}',
                                      'timeout': 600,
                                      // in seconds
                                      'prefill': {
                                        'contact': GetStorage().read("email"),
                                        'name': GetStorage().read("name"),
                                        //'email': 'gaurav.kumar@example.com'
                                      }
                                    };

                                    _razorpay.open(options);
                                  });
                                } else {
                                  log("message is empty");
                                  Get.to(() => LoginScreen());
                                }
                              }
                              //  Get.to(()=>LoginScreen());
                            },
                            title: "Checkout",
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                ), //CartBottomBar(itemAvailableInCart: true, onTap: () {  },),
              ),
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    //response..toString()
    // Do something when payment succeeds
    log("success" + response.toString());
    log("success" + response.signature.toString());
    log("success" + response.signature.toString());
    homeController.itemList.clear();
    homeController.itemId.clear();
    homeController.api.localStorage.remove("productList");
    cartController
        .getVerifyPayment(
            orderId: cartController.orderId.value,
            sign: response.signature.toString(),
            paymentId: response.paymentId.toString())
        .whenComplete(() => Get.offAll(() => OrderHistoryStatusDetails(),
            arguments: cartController.orderId.value));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    log("error" + response.toString());
    //response.
    //customToast(type: "error", message: response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet is selected
    log("wallet" + response.toString());
    //customToast(type: "error", message: "message");
  }
}
