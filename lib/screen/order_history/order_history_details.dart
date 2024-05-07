import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/controller/cart_controller/cart_controller.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import 'package:mandiweb/screen/homescreen/home_screen.dart';

import '../../constant/const_text.dart';
import '../../constant/constant_color.dart';
import '../../model/order_history/order_history_details.dart';
import '../../model/retail_model/retails_model.dart';
import '../../widgets/product/product_not_found.dart';
import '../product/product_details_screen.dart';

class OrderHistoryDetails extends StatefulWidget {
  const OrderHistoryDetails({super.key});

  @override
  State<OrderHistoryDetails> createState() => _OrderHistoryDetailsState();
}

class _OrderHistoryDetailsState extends State<OrderHistoryDetails> {
  final cartController = Get.put(CartController());
  var id =  Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: appBar("Order History", context),
      body: //Obx(()=>
          SafeArea(
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
                          Get.back();
                          //Get.to(()=>HomeScreen());
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
                        "Order History...",
                        style: kHeading16Boldblack500,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [],
                ),
              ),
              FutureBuilder(
                  future: cartController.orderDetail(id: id),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
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
                        OrderHistoryDetailsModel? home =
                            snapshot.data as OrderHistoryDetailsModel;

                        return home.result.toString().isEmpty
                            ? ProductNotFound()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Container(
                                      width: Get.width,
                                      //height: 44,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 10),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF0FDF4),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Color(0xFF17A34A),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Icon(
                                              Icons.check_circle_rounded,
                                              color: Color(0xff1D8248),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Your Payment has been verified.',
                                            style: TextStyle(
                                              color: Color(0xFF1D8248),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Container(
                                      width: Get.width,
                                      //height: 44,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 10),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF0FDF4),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                            width: 1,
                                            strokeAlign:
                                                BorderSide.strokeAlignOutside,
                                            color: Color(0xFF17A34A),
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(4),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 24,
                                            height: 24,
                                            clipBehavior: Clip.antiAlias,
                                            decoration: BoxDecoration(),
                                            child: Icon(
                                                Icons.check_circle_rounded,
                                                color: Color(0xff1D8248)),
                                          ),
                                          const SizedBox(width: 8),
                                          Text(
                                            'Your order has been placed successfully.',
                                            style: TextStyle(
                                              color: Color(0xFF1D8248),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      'Payment Details',
                                      style: TextStyle(
                                        color: Color(0xFF1D8248),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Container(
                                      width: Get.width,
                                      //height: 130,//116,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 16),
                                      decoration: ShapeDecoration(
                                        color: Color(0xFFF0FDF4),
                                        shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              width: 1,
                                              color: Color(0xFF17A34A)),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: double.infinity,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Order ID:',
                                                  style: TextStyle(
                                                    color: Color(0xFF3A3A3A),
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w700,
                                                  ),
                                                ),
                                                const SizedBox(height: 4),
                                                Text(
                                                  '${home.result!.name}',
                                                  style: TextStyle(
                                                    color: Color(0xFF3A3A3A),
                                                    fontSize: 14,
                                                    fontFamily: 'Inter',
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(height: 8),
                                          Text(
                                            'Payment ID:',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${home.result!.paymentId.toString()}',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight:
                                                  FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Text(
                                      'Added Products:',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w500,
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    //height: MediaQuery.of(context).size.height * 0.85 ,
                                    child: SingleChildScrollView(
                                      child: ListView.separated(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.vertical,
                                        physics: const BouncingScrollPhysics(),
                                        itemCount:
                                            home.result!.orderLine!.length,
                                        dragStartBehavior:
                                            DragStartBehavior.start,
                                        itemBuilder: (context, index) {
                                          var singleData =
                                              home.result!.orderLine![index];

                                          return Stack(
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Get.to(
                                                      () => ProductDetailsPage(
                                                            id: singleData.id!,
                                                          ),
                                                      arguments: singleData.id);
                                                },
                                                child: Padding(
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16,
                                                      vertical: 2),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        boxShadow: const [
                                                          BoxShadow(
                                                            color:
                                                                Colors.black12,
                                                            offset: Offset(
                                                              .05,
                                                              .05,
                                                            ),
                                                            blurRadius: 2.0,
                                                            spreadRadius: 1.0,
                                                          ), //BoxShadow
                                                          BoxShadow(
                                                            color: Colors.white,
                                                            offset: Offset(
                                                                0.0, 0.0),
                                                            blurRadius: 0.0,
                                                            spreadRadius: 0.0,
                                                          ),
                                                        ],
                                                        color: Colors.white),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(
                                                          height: 75,
                                                          width: 75,
                                                          child: Image.network(
                                                            singleData
                                                                .productImage
                                                                .toString(),
                                                            fit: BoxFit
                                                                .scaleDown,
                                                          ),
                                                        ),
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
                                                                Text(
                                                                  singleData
                                                                      .productName
                                                                      .toString(),
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  softWrap:
                                                                      false,
                                                                  style:
                                                                      const TextStyle(
                                                                    color: Color(
                                                                        0xFF181725),
                                                                    fontSize:
                                                                        12,
                                                                    fontFamily:
                                                                        'General Sans',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    height:
                                                                        1.12,
                                                                    letterSpacing:
                                                                        0.10,
                                                                  ),
                                                                ),

                                                                const SizedBox(
                                                                  height: 2,
                                                                ),

                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          top:
                                                                              2,
                                                                          bottom:
                                                                              2),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      // Text(
                                                                      //   "Rs.${singleData.actualPrice}",
                                                                      //   style: const TextStyle(
                                                                      //     color:
                                                                      //     Color(0xFF181725),
                                                                      //     fontSize: 14,
                                                                      //     fontFamily:
                                                                      //     'General Sans',
                                                                      //     fontWeight:
                                                                      //     FontWeight.w600,
                                                                      //     height: 1.50,
                                                                      //     letterSpacing: 0.10,
                                                                      //   ),
                                                                      // ),
                                                                      Text(
                                                                        "₹" +
                                                                            singleData.priceUnit.toString(),
                                                                        style: kHeading21Boldblack700.copyWith(
                                                                            fontSize:
                                                                                14),
                                                                      ),
                                                                      //PriceDetailDiscountText(price: singleData.actualDiscount.toString(),),
                                                                      const SizedBox(
                                                                        width:
                                                                            5,
                                                                      ),
                                                                      // Container(
                                                                      // decoration:BoxDecoration(
                                                                      // borderRadius: BorderRadius.circular(4),
                                                                      // color: Color(0xffCF1C0C).withOpacity(0.15),
                                                                      // ),
                                                                      // child: Padding(
                                                                      // padding: const EdgeInsets.all(4.0),
                                                                      // child: Text(
                                                                      // '${calculateDiscountPercentage(singleData.mrp!,singleData.listPrice!).floor()}% OFF',
                                                                      // style: TextStyle(
                                                                      // color: Color(0xffCF1C0C),
                                                                      // fontSize: 11,
                                                                      // fontFamily: 'inter',
                                                                      // fontWeight: FontWeight.w500,
                                                                      // ),
                                                                      // textAlign: TextAlign.center,
                                                                      // ),
                                                                      // ),
                                                                      // )
                                                                    ],
                                                                  ),
                                                                ),

                                                                // QtyScreen( productId: singleData.id.toString(),products: pro,),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  right: 8.0),
                                                          child: Container(
                                                            width: 74,
                                                            height: 24,
                                                            //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          4),
                                                              color: Color(
                                                                  0xff1D8248), //Color(0xffEEFDF8),
                                                              //border: Border.all(color: Color(0xff6D8A7B))
                                                            ),
                                                            child:
                                                                AnimatedSwitcher(
                                                                    duration: const Duration(
                                                                        milliseconds:
                                                                            500),
                                                                    child: Text(
                                                                      "Quantity: ${singleData.quantity.toString()}",
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style:
                                                                          kHeading11white700,
                                                                    )),
                                                          ),
                                                        )
                                                        // QtyScreen( productId: singleData.id.toString(),products: pro,),
                                                      ],
                                                    ),
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
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
                                        child: Text("Retails Details :",
                                            style: TextStyle()),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  // Padding(
                                  //   padding: const EdgeInsets.symmetric(
                                  //       horizontal: 8),
                                  //   child: Container(
                                  //     padding: EdgeInsets.symmetric(
                                  //         horizontal: 16, vertical: 16),
                                  //     decoration: BoxDecoration(
                                  //       borderRadius: BorderRadius.circular(8),
                                  //       color: kwhitecolor,
                                  //     ),
                                  //     child: Column(
                                  //       crossAxisAlignment:
                                  //           CrossAxisAlignment.start,
                                  //       children: [
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Text(
                                  //               "Item :",
                                  //             ),
                                  //             const Spacer(),
                                  //             Text(
                                  //               '${home.result!.orderLine!.length}', // You can replace this with your actual total
                                  //               style: kBody16black500.copyWith(
                                  //                   fontSize: 12,
                                  //                   color: kBlack,
                                  //                   fontWeight: FontWeight
                                  //                       .w400), // TextStyle(fontSize: 14.0,color: kwhitecolor),
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Text(
                                  //               "Your Saving",
                                  //             ),
                                  //             const Spacer(),
                                  //             Text(
                                  //               "₹${home.result!.discount!.toString()}",
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Text(
                                  //               "Subtotal",
                                  //             ),
                                  //             const Spacer(),
                                  //             Text(
                                  //               "\₹${home.result!.amountTotal!.toString()}",
                                  //             ),
                                  //             //Text("₹0",),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Text(
                                  //               "Delivery Charges",
                                  //             ),
                                  //             const Spacer(),
                                  //             Row(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.start,
                                  //               children: [
                                  //                 Text(
                                  //                   "₹50",
                                  //                   style: TextStyle(
                                  //                     decoration: TextDecoration
                                  //                         .lineThrough,
                                  //                   ),
                                  //                 ),
                                  //                 Text("Free",
                                  //                     style: TextStyle(
                                  //                         color:
                                  //                             kPrimaryGreenColor)),
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Text(
                                  //               "Handling Charges",
                                  //             ),
                                  //             const Spacer(),
                                  //             Row(
                                  //               mainAxisAlignment:
                                  //                   MainAxisAlignment.start,
                                  //               children: [
                                  //                 Text("₹50",
                                  //                     style: TextStyle(
                                  //                       //color: kPrimaryGreenColor,
                                  //                       decoration:
                                  //                           TextDecoration
                                  //                               .lineThrough,
                                  //                     )),
                                  //                 Text("Free",
                                  //                     style: TextStyle(
                                  //                         color:
                                  //                             kPrimaryGreenColor)),
                                  //               ],
                                  //             ),
                                  //           ],
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         Divider(
                                  //           height: 2,
                                  //           thickness: 1,
                                  //           color: kBlack,
                                  //         ),
                                  //         SizedBox(
                                  //           height: 5,
                                  //         ),
                                  //         Row(
                                  //           mainAxisAlignment:
                                  //               MainAxisAlignment.spaceEvenly,
                                  //           children: [
                                  //             Text(
                                  //               "Total",
                                  //             ),
                                  //             const Spacer(),
                                  //             Text(
                                  //               "\₹${home.result!.amountTotal!.toString()}",
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   height: 40,
                                  // ),
                                  // FutureBuilder(
                                  //     future: HomeController()
                                  //         .getRetailsAddress(
                                  //             id: HomeController()
                                  //                 .api
                                  //                 .localStorage
                                  //                 .read("sellerId")),
                                  //     builder:
                                  //         (context, AsyncSnapshot snapshot) {
                                  //       if (snapshot.connectionState ==
                                  //           ConnectionState.done) {
                                  //         // If we got an error
                                  //
                                  //         if (snapshot.hasError) {
                                  //           return Center(
                                  //             child: Text(
                                  //               '${snapshot.error} occurred',
                                  //               style: TextStyle(fontSize: 18),
                                  //             ),
                                  //           );
                                  //
                                  //           // if we got our data
                                  //         } else if (snapshot.hasData) {
                                  //           // Extracting data from snapshot object
                                  //           RetailsModel? retails =
                                  //               snapshot.data as RetailsModel;
                                  //
                                  //           return Column(
                                  //             children: [
                                  //               SizedBox(
                                  //                 height: 10,
                                  //               ),
                                  //               //Text("${retails.result.toString() == '[]'} ${retails?.result?.isEmpty}"),
                                  //               retails.result == null ||
                                  //                       retails.result
                                  //                               .toString() ==
                                  //                           '[]'
                                  //                   ? SizedBox()
                                  //                   : Padding(
                                  //                       padding:
                                  //                           const EdgeInsets
                                  //                               .symmetric(
                                  //                               horizontal: 16),
                                  //                       child: Column(
                                  //                         children: [
                                  //                           Padding(
                                  //                             padding:
                                  //                                 const EdgeInsets
                                  //                                     .symmetric(
                                  //                                     horizontal:
                                  //                                         16),
                                  //                             child: Container(
                                  //                               decoration:
                                  //                                   const BoxDecoration(
                                  //                                 color:
                                  //                                     kPrimaryAppbarColor,
                                  //                                 borderRadius:
                                  //                                     BorderRadius
                                  //                                         .all(
                                  //                                   Radius
                                  //                                       .circular(
                                  //                                           8),
                                  //                                 ),
                                  //                               ),
                                  //                               child: Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                         .only(
                                  //                                         left:
                                  //                                             23,
                                  //                                         top:
                                  //                                             14),
                                  //                                 child: Column(
                                  //                                   crossAxisAlignment:
                                  //                                       CrossAxisAlignment
                                  //                                           .start,
                                  //                                   children: [
                                  //                                     Column(
                                  //                                       crossAxisAlignment:
                                  //                                           CrossAxisAlignment.start,
                                  //                                       mainAxisAlignment:
                                  //                                           MainAxisAlignment.start,
                                  //                                       children: [
                                  //                                         Row(
                                  //                                           children: const [
                                  //                                             Icon(Icons.person),
                                  //                                             SizedBox(
                                  //                                               width: 14.33,
                                  //                                             ),
                                  //                                             Text(
                                  //                                               "Retailer Details",
                                  //                                               //style: KBody16black500,
                                  //                                             ),
                                  //                                           ],
                                  //                                         ),
                                  //                                         SizedBox(
                                  //                                             width: 45,
                                  //                                             child: Divider(
                                  //                                               color: kPrimaryGreenColor,
                                  //                                               height: 2,
                                  //                                             )),
                                  //                                       ],
                                  //                                     ),
                                  //                                     Padding(
                                  //                                       padding:
                                  //                                           const EdgeInsets.symmetric(
                                  //                                         horizontal:
                                  //                                             16,
                                  //                                       ),
                                  //                                       child:
                                  //                                           Column(
                                  //                                         crossAxisAlignment:
                                  //                                             CrossAxisAlignment.start,
                                  //                                         children: [
                                  //                                           const SizedBox(
                                  //                                             height: 10,
                                  //                                           ),
                                  //                                           Text(
                                  //                                             "${retails.result?[0].name}", //$id (${getCustomerResponse?.result?.vendorCode})
                                  //                                             softWrap: true,
                                  //                                             overflow: TextOverflow.ellipsis,
                                  //                                             maxLines: 3,
                                  //                                             // style: KBody15black600,
                                  //                                           ),
                                  //                                           Row(
                                  //                                             children: [
                                  //                                               Expanded(
                                  //                                                 child: Text(
                                  //                                                   "${retails.result?[0].address}",
                                  //                                                   //style:
                                  //                                                   // KBody16mediumblackcolor500,
                                  //                                                 ),
                                  //                                               ),
                                  //                                             ],
                                  //                                           ),
                                  //                                           Row(
                                  //                                             children: [
                                  //                                               Expanded(
                                  //                                                 child: Text(
                                  //                                                   "${retails.result?[0].mobile}",
                                  //                                                   //style:
                                  //                                                   // KBody16mediumblackcolor500,
                                  //                                                 ),
                                  //                                               ),
                                  //                                             ],
                                  //                                           ),
                                  //                                           SizedBox(
                                  //                                             height: 10,
                                  //                                           ),
                                  //                                         ],
                                  //                                       ),
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                             ),
                                  //                           ),
                                  //                         ],
                                  //                       ),
                                  //                     ),
                                  //               SizedBox(
                                  //                 height: 10,
                                  //               ),
                                  //
                                  //               Padding(
                                  //                 padding: const EdgeInsets
                                  //                     .symmetric(
                                  //                     horizontal: 16),
                                  //                 child: Column(
                                  //                   children: [
                                  //                     Padding(
                                  //                       padding:
                                  //                           const EdgeInsets
                                  //                               .symmetric(
                                  //                               horizontal: 16),
                                  //                       child: Container(
                                  //                         decoration:
                                  //                             const BoxDecoration(
                                  //                           color:
                                  //                               kPrimaryAppbarColor,
                                  //                           borderRadius:
                                  //                               BorderRadius
                                  //                                   .all(
                                  //                             Radius.circular(
                                  //                                 8),
                                  //                           ),
                                  //                         ),
                                  //                         child: Padding(
                                  //                           padding:
                                  //                               const EdgeInsets
                                  //                                   .only(
                                  //                                   left: 23,
                                  //                                   top: 14),
                                  //                           child: Column(
                                  //                             crossAxisAlignment:
                                  //                                 CrossAxisAlignment
                                  //                                     .start,
                                  //                             children: [
                                  //                               Column(
                                  //                                 crossAxisAlignment:
                                  //                                     CrossAxisAlignment
                                  //                                         .start,
                                  //                                 mainAxisAlignment:
                                  //                                     MainAxisAlignment
                                  //                                         .start,
                                  //                                 children: [
                                  //                                   Row(
                                  //                                     children: const [
                                  //                                       Icon(Icons
                                  //                                           .person),
                                  //                                       SizedBox(
                                  //                                         width:
                                  //                                             14.33,
                                  //                                       ),
                                  //                                       Text(
                                  //                                         "Customer Details",
                                  //                                         //style: KBody16black500,
                                  //                                       ),
                                  //                                     ],
                                  //                                   ),
                                  //                                   SizedBox(
                                  //                                       width:
                                  //                                           45,
                                  //                                       child:
                                  //                                           Divider(
                                  //                                         color:
                                  //                                             kPrimaryGreenColor,
                                  //                                         height:
                                  //                                             2,
                                  //                                       )),
                                  //                                 ],
                                  //                               ),
                                  //                               Padding(
                                  //                                 padding:
                                  //                                     const EdgeInsets
                                  //                                         .symmetric(
                                  //                                   horizontal:
                                  //                                       16,
                                  //                                 ),
                                  //                                 child: Column(
                                  //                                   crossAxisAlignment:
                                  //                                       CrossAxisAlignment
                                  //                                           .start,
                                  //                                   children: [
                                  //                                     const SizedBox(
                                  //                                       height:
                                  //                                           10,
                                  //                                     ),
                                  //                                     Text(
                                  //                                       "${home.result!.partnerAddress!.name.toString()}", //$id (${getCustomerResponse?.result?.vendorCode})
                                  //                                       softWrap:
                                  //                                           true,
                                  //                                       overflow:
                                  //                                           TextOverflow.ellipsis,
                                  //                                       maxLines:
                                  //                                           3,
                                  //                                       // style: KBody15black600,
                                  //                                     ),
                                  //                                     Row(
                                  //                                       children: [
                                  //                                         Expanded(
                                  //                                           child:
                                  //                                               Text(
                                  //                                             "${home.result!.partnerAddress!.mobile.toString()}",
                                  //                                             //style:
                                  //                                             // KBody16mediumblackcolor500,
                                  //                                           ),
                                  //                                         ),
                                  //                                       ],
                                  //                                     ),
                                  //                                     SizedBox(
                                  //                                       height:
                                  //                                           10,
                                  //                                     ),
                                  //                                   ],
                                  //                                 ),
                                  //                               ),
                                  //                             ],
                                  //                           ),
                                  //                         ),
                                  //                       ),
                                  //                     ),
                                  //                   ],
                                  //                 ),
                                  //               ),
                                  //
                                  //               // SizedBox(height: 10,),
                                  //               //
                                  //               //
                                  //               //
                                  //               SizedBox(
                                  //                 height: 100,
                                  //               ),
                                  //             ],
                                  //           );
                                  //         }
                                  //       }
                                  //
                                  //       // Displaying LoadingSpinner to indicate waiting state
                                  //       return SizedBox(
                                  //         height: MediaQuery.of(context)
                                  //                 .size
                                  //                 .height /
                                  //             1.3,
                                  //         child: const Center(
                                  //           child: CircularProgressIndicator(),
                                  //         ),
                                  //       );
                                  //     }),
                                ],
                              );
                      }
                    }

                    // Displaying LoadingSpinner to indicate waiting state
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}





















class OrderHistoryStatusDetails extends StatefulWidget {
  const OrderHistoryStatusDetails({super.key});

  @override
  State<OrderHistoryStatusDetails> createState() => _OrderHistoryStatusDetailsState();
}

class _OrderHistoryStatusDetailsState extends State<OrderHistoryStatusDetails> {
  final cartController = Get.put(CartController());
  var id =Get.arguments;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

//    cartController.orderDetail(id: id);
    //homeController.itemLoad();//(id: homeController.api.localStorage.read("warehouseId"));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar("Order History", context),
      body: //Obx(()=>
      SafeArea(
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
                          Get.to(()=>HomeScreen());
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
                        "Order History...",
                        style: kHeading16Boldblack500,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Column(
                  children: [],
                ),
              ),
              FutureBuilder(
                  future: cartController.orderDetail(id: id),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
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
                        OrderHistoryDetailsModel? home =
                        snapshot.data as OrderHistoryDetailsModel;

                        return home.result.toString().isEmpty
                            ? ProductNotFound()
                            : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Container(
                                width: Get.width,
                                //height: 44,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF0FDF4),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign:
                                      BorderSide.strokeAlignOutside,
                                      color: Color(0xFF17A34A),
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Icon(
                                        Icons.check_circle_rounded,
                                        color: Color(0xff1D8248),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Your Payment has been verified.',
                                      style: TextStyle(
                                        color: Color(0xFF1D8248),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                        height: 0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Container(
                                width: Get.width,
                                //height: 44,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 10),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF0FDF4),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1,
                                      strokeAlign:
                                      BorderSide.strokeAlignOutside,
                                      color: Color(0xFF17A34A),
                                    ),
                                    borderRadius:
                                    BorderRadius.circular(4),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(),
                                      child: Icon(
                                          Icons.check_circle_rounded,
                                          color: Color(0xff1D8248)),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Your order has been placed successfully.',
                                      style: TextStyle(
                                        color: Color(0xFF1D8248),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Text(
                                'Payment Details',
                                style: TextStyle(
                                  color: Color(0xFF1D8248),
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Container(
                                width: Get.width,
                                //height: 130,//116,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 16),
                                decoration: ShapeDecoration(
                                  color: Color(0xFFF0FDF4),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1,
                                        color: Color(0xFF17A34A)),
                                    borderRadius:
                                    BorderRadius.circular(8),
                                  ),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment:
                                  MainAxisAlignment.start,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                        MainAxisAlignment.center,
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Order ID:',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          const SizedBox(height: 4),
                                          Text(
                                            '${home.result!.name}',
                                            style: TextStyle(
                                              color: Color(0xFF3A3A3A),
                                              fontSize: 14,
                                              fontFamily: 'Inter',
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Payment ID:',
                                      style: TextStyle(
                                        color: Color(0xFF3A3A3A),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '${home.result!.paymentId.toString()}',
                                      style: TextStyle(
                                        color: Color(0xFF3A3A3A),
                                        fontSize: 14,
                                        fontFamily: 'Inter',
                                        fontWeight:
                                        FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0),
                              child: Text(
                                'Added Products:',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              //height: MediaQuery.of(context).size.height * 0.85 ,
                              child: SingleChildScrollView(
                                child: ListView.separated(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  physics: const BouncingScrollPhysics(),
                                  itemCount:
                                  home.result!.orderLine!.length,
                                  dragStartBehavior:
                                  DragStartBehavior.start,
                                  itemBuilder: (context, index) {
                                    var singleData =
                                    home.result!.orderLine![index];

                                    return Stack(
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            Get.to(
                                                    () => ProductDetailsPage(
                                                  id: singleData.id!,
                                                ),
                                                arguments: singleData.id);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 16,
                                                vertical: 2),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                  BorderRadius
                                                      .circular(8),
                                                  boxShadow: const [
                                                    BoxShadow(
                                                      color:
                                                      Colors.black12,
                                                      offset: Offset(
                                                        .05,
                                                        .05,
                                                      ),
                                                      blurRadius: 2.0,
                                                      spreadRadius: 1.0,
                                                    ), //BoxShadow
                                                    BoxShadow(
                                                      color: Colors.white,
                                                      offset: Offset(
                                                          0.0, 0.0),
                                                      blurRadius: 0.0,
                                                      spreadRadius: 0.0,
                                                    ),
                                                  ],
                                                  color: Colors.white),
                                              child: Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  SizedBox(
                                                    height: 75,
                                                    width: 75,
                                                    child: Image.network(
                                                      singleData
                                                          .productImage
                                                          .toString(),
                                                      fit: BoxFit
                                                          .scaleDown,
                                                    ),
                                                  ),
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
                                                          Text(
                                                            singleData
                                                                .productName
                                                                .toString(),
                                                            maxLines: 2,
                                                            overflow:
                                                            TextOverflow
                                                                .ellipsis,
                                                            softWrap:
                                                            false,
                                                            style:
                                                            const TextStyle(
                                                              color: Color(
                                                                  0xFF181725),
                                                              fontSize:
                                                              12,
                                                              fontFamily:
                                                              'General Sans',
                                                              fontWeight:
                                                              FontWeight
                                                                  .w600,
                                                              height:
                                                              1.12,
                                                              letterSpacing:
                                                              0.10,
                                                            ),
                                                          ),

                                                          const SizedBox(
                                                            height: 2,
                                                          ),

                                                          Padding(
                                                            padding:
                                                            const EdgeInsets
                                                                .only(
                                                                top:
                                                                2,
                                                                bottom:
                                                                2),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                              children: [
                                                                // Text(
                                                                //   "Rs.${singleData.actualPrice}",
                                                                //   style: const TextStyle(
                                                                //     color:
                                                                //     Color(0xFF181725),
                                                                //     fontSize: 14,
                                                                //     fontFamily:
                                                                //     'General Sans',
                                                                //     fontWeight:
                                                                //     FontWeight.w600,
                                                                //     height: 1.50,
                                                                //     letterSpacing: 0.10,
                                                                //   ),
                                                                // ),
                                                                Text(
                                                                  "₹" +
                                                                      singleData.priceUnit.toString(),
                                                                  style: kHeading21Boldblack700.copyWith(
                                                                      fontSize:
                                                                      14),
                                                                ),
                                                                //PriceDetailDiscountText(price: singleData.actualDiscount.toString(),),
                                                                const SizedBox(
                                                                  width:
                                                                  5,
                                                                ),
                                                                // Container(
                                                                // decoration:BoxDecoration(
                                                                // borderRadius: BorderRadius.circular(4),
                                                                // color: Color(0xffCF1C0C).withOpacity(0.15),
                                                                // ),
                                                                // child: Padding(
                                                                // padding: const EdgeInsets.all(4.0),
                                                                // child: Text(
                                                                // '${calculateDiscountPercentage(singleData.mrp!,singleData.listPrice!).floor()}% OFF',
                                                                // style: TextStyle(
                                                                // color: Color(0xffCF1C0C),
                                                                // fontSize: 11,
                                                                // fontFamily: 'inter',
                                                                // fontWeight: FontWeight.w500,
                                                                // ),
                                                                // textAlign: TextAlign.center,
                                                                // ),
                                                                // ),
                                                                // )
                                                              ],
                                                            ),
                                                          ),

                                                          // QtyScreen( productId: singleData.id.toString(),products: pro,),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .only(
                                                        right: 8.0),
                                                    child: Container(
                                                      width: 74,
                                                      height: 24,
                                                      //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            4),
                                                        color: Color(
                                                            0xff1D8248), //Color(0xffEEFDF8),
                                                        //border: Border.all(color: Color(0xff6D8A7B))
                                                      ),
                                                      child:
                                                      AnimatedSwitcher(
                                                          duration: const Duration(
                                                              milliseconds:
                                                              500),
                                                          child: Text(
                                                            "Quantity: ${singleData.quantity.toString()}",
                                                            textAlign:
                                                            TextAlign
                                                                .center,
                                                            style:
                                                            kHeading11white700,
                                                          )),
                                                    ),
                                                  )
                                                  // QtyScreen( productId: singleData.id.toString(),products: pro,),
                                                ],
                                              ),
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
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
                                  child: Text("Retails Details :",
                                      style: TextStyle()),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: kwhitecolor,
                                ),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "Item :",
                                        ),
                                        const Spacer(),
                                        Text(
                                          '${home.result!.orderLine!.length}', // You can replace this with your actual total
                                          style: kBody16black500.copyWith(
                                              fontSize: 12,
                                              color: kBlack,
                                              fontWeight: FontWeight
                                                  .w400), // TextStyle(fontSize: 14.0,color: kwhitecolor),
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
                                          "₹${home.result!.discount!.toString()}",
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
                                        Text(
                                          "\₹${home.result!.amountTotal!.toString()}",
                                        ),
                                        //Text("₹0",),
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
                                                decoration: TextDecoration
                                                    .lineThrough,
                                              ),
                                            ),
                                            Text("Free",
                                                style: TextStyle(
                                                    color:
                                                    kPrimaryGreenColor)),
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
                                                  TextDecoration
                                                      .lineThrough,
                                                )),
                                            Text("Free",
                                                style: TextStyle(
                                                    color:
                                                    kPrimaryGreenColor)),
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
                                        Text(
                                          "\₹${home.result!.amountTotal!.toString()}",
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            FutureBuilder(
                                future: HomeController()
                                    .getRetailsAddress(
                                    id: HomeController()
                                        .api
                                        .localStorage
                                        .read("sellerId")),
                                builder:
                                    (context, AsyncSnapshot snapshot) {
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
                                              retails.result
                                                  .toString() ==
                                                  '[]'
                                              ? SizedBox()
                                              : Padding(
                                            padding:
                                            const EdgeInsets
                                                .symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      horizontal:
                                                      16),
                                                  child: Container(
                                                    decoration:
                                                    const BoxDecoration(
                                                      color:
                                                      kPrimaryAppbarColor,
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(
                                                        Radius
                                                            .circular(
                                                            8),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(
                                                          left:
                                                          23,
                                                          top:
                                                          14),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.start,
                                                            children: [
                                                              Row(
                                                                children: const [
                                                                  Icon(Icons.person),
                                                                  SizedBox(
                                                                    width: 14.33,
                                                                  ),
                                                                  Text(
                                                                    "Retailer Details",
                                                                    //style: KBody16black500,
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  width: 45,
                                                                  child: Divider(
                                                                    color: kPrimaryGreenColor,
                                                                    height: 2,
                                                                  )),
                                                            ],
                                                          ),
                                                          Padding(
                                                            padding:
                                                            const EdgeInsets.symmetric(
                                                              horizontal:
                                                              16,
                                                            ),
                                                            child:
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.start,
                                                              children: [
                                                                const SizedBox(
                                                                  height: 10,
                                                                ),
                                                                Text(
                                                                  "${retails.result?[0].name}", //$id (${getCustomerResponse?.result?.vendorCode})
                                                                  softWrap: true,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  maxLines: 3,
                                                                  // style: KBody15black600,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child: Text(
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
                                                                      child: Text(
                                                                        "${retails.result?[0].mobile}",
                                                                        //style:
                                                                        // KBody16mediumblackcolor500,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height: 10,
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

                                          Padding(
                                            padding: const EdgeInsets
                                                .symmetric(
                                                horizontal: 16),
                                            child: Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                  const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16),
                                                  child: Container(
                                                    decoration:
                                                    const BoxDecoration(
                                                      color:
                                                      kPrimaryAppbarColor,
                                                      borderRadius:
                                                      BorderRadius
                                                          .all(
                                                        Radius.circular(
                                                            8),
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
                                                                  width:
                                                                  45,
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
                                                                  "${home.result!.partnerAddress!.name.toString()}", //$id (${getCustomerResponse?.result?.vendorCode})
                                                                  softWrap:
                                                                  true,
                                                                  overflow:
                                                                  TextOverflow.ellipsis,
                                                                  maxLines:
                                                                  3,
                                                                  // style: KBody15black600,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Expanded(
                                                                      child:
                                                                      Text(
                                                                        "${home.result!.partnerAddress!.mobile.toString()}",
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
                                    height: MediaQuery.of(context)
                                        .size
                                        .height /
                                        1.3,
                                    child: const Center(
                                      child: CircularProgressIndicator(),
                                    ),
                                  );
                                }),
                          ],
                        );
                      }
                    }

                    // Displaying LoadingSpinner to indicate waiting state
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }),
            ],
          ),
        ),
        // ),
      ),
      // bottomNavigationBar:Obx(()=>
      // homeController.itemList.isEmpty ?SizedBox():Padding(
      //   padding: const EdgeInsets.all(0.0),
      //   child: SafeArea(
      //     child: Container(
      //
      //       height: 77,//155,// MediaQuery.of(context).size.height *//0.160,
      //       padding: EdgeInsets.symmetric(horizontal: 8.0,),
      //       decoration: BoxDecoration(
      //         borderRadius: BorderRadius.circular(24),
      //         color: kwhitecolor,
      //       ),
      //       child: Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Column(
      //           children: [
      //             // Row(
      //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             //   children: <Widget>[
      //             //     //if (itemAvailableInCart)
      //             //      Text("items :",
      //             //          style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(color: kwhitecolor,fontSize: 14.0,),
      //             //     ),
      //             //     Obx(()=> Text(
      //             //         '${homeController.itemList.length}', // You can replace this with your actual total
      //             //         style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(fontSize: 14.0,color: kwhitecolor),
      //             //       ),
      //             //     ),
      //             //   ],
      //             // ),
      //             // Row(
      //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             //   children: <Widget>[
      //             //     //if (itemAvailableInCart)
      //             //     Text("Delivery Charge :",
      //             //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(color: kwhitecolor,fontSize: 14.0,),
      //             //     ),
      //             //      Text(
      //             //       '0', // You can replace this with your actual total
      //             //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(fontSize: 14.0,color: kwhitecolor),
      //             //
      //             //     ),
      //             //   ],
      //             // ),
      //             // Row(
      //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             //   children: <Widget>[
      //             //     //if (itemAvailableInCart)
      //             //     Text("Handling Charge :",
      //             //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(color: kwhitecolor,fontSize: 14.0,),
      //             //     ),
      //             //     Text(
      //             //       '0', // You can replace this with your actual total
      //             //       style:kBody16black500.copyWith(fontSize:12,color: kBlack,fontWeight: FontWeight.w400),// TextStyle(fontSize: 14.0,color: kwhitecolor),
      //             //     ),
      //             //   ],
      //             // ),
      //             // SizedBox(height: 4,),
      //             // Row(
      //             //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             //   children: <Widget>[
      //             //     Text("Total :",
      //             //       style:kBody16black500.copyWith(color: kblue),
      //             //     ),
      //             //     Text(
      //             //       '\₹${double.parse(homeController.itemSum.value).toStringAsFixed(2)}', // You can replace this with your actual total
      //             //       style:kBody16black500.copyWith(color: kblue),// TextStyle(fontSize: 14.0,color: kwhitecolor),
      //             //     ),
      //             //   ],
      //             // ),
      //             // SizedBox(height: 4,),
      //             CustomFButton(onTap: ()async{
      //               final String? Token=GetStorage().read("authToken");
      //
      //               log(Token.toString());
      //               log("${Token ==null}");
      //               log("${Token =="null"}");
      //               if (Token==null){
      //
      //                 log("message is empty");
      //                 Get.to(()=> LoginScreen());
      //
      //               }
      //               else if(Token!="null"|| Token.isNotEmpty){
      //
      //                 EasyLoading.show(
      //                   status: 'Placing order to Mymandi',
      //                 );
      //                 cartController.cart().whenComplete(() async {
      //
      //                   EasyLoading.show(
      //                     status: 'loading payment screen',
      //                   );
      //
      //                   PaymentResponseModel paymentResponse = await cartController.getCart(id: cartController.orderId.value);
      //
      //                   EasyLoading.dismiss();
      //
      //                   var options = {
      //                     'key': 'rzp_live_LbTrdAVlKwzH0F',//'zp_test_KIyTgacaYgVNzb',//'rzp_live_LbTrdAVlKwzH0F',
      //                     'amount': '${paymentResponse.result?.amount}', //in the smallest currency sub-unit.
      //                     'name': 'Mymandi',
      //                     'order_id': '${paymentResponse.result?.id.toString()}', // Generate order_id using Orders API
      //                     'description': '${paymentResponse.result?.notes.toString()}',
      //                     'timeout': 600, // in seconds
      //                     'prefill': {
      //                       'contact': GetStorage().read("email"),
      //                       'name': GetStorage().read("name"),
      //                       //'email': 'gaurav.kumar@example.com'
      //                     }
      //                   };
      //
      //
      //                   _razorpay.open(options);
      //
      //
      //                 });
      //
      //
      //               }
      //               else {
      //
      //                 log("message is empty");
      //                 Get.to(()=> LoginScreen());
      //
      //               }
      //
      //               //  Get.to(()=>LoginScreen());
      //             },title: "Checkout",),
      //             SizedBox(height: 4,),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ),//CartBottomBar(itemAvailableInCart: true, onTap: () {  },),
      // ),
      //),
    );
  }
}