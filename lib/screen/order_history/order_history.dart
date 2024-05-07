import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import 'package:mandiweb/widgets/product/product_not_found.dart';
import '../../model/order_history/order_history.dart';
import '../../widgets/appBar.dart';
import 'order_history_details.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({super.key});

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  final controller = Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Order History', context),
      body: SingleChildScrollView(
        child: Column(
          children: [

            FutureBuilder(
                future:  controller.orderHistory(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    // If we got an error

                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          //'Internet Connection issue occurred',
                          '${snapshot.error} occurred',
                          style: TextStyle(fontSize: 18),
                        ),
                      );

                      // if we got our data
                    } else if (snapshot.hasData) {
                      // Extracting data from snapshot object
                      OrderHistoryModel home =
                      snapshot.data as OrderHistoryModel;

                      return Column(
                        children: [

                          home.message.toString()=='No Data Found.'?ProductNotFound():ListView.separated(
                              shrinkWrap: true,
                              itemCount: home.result!.length,
                              itemBuilder:(context, index) {
                                var singleData=home.result![index];
                                return ListTile(
                                  onTap: () {
                                    log("message ${singleData.id.toString()}");
                                    Get.to(()=>const OrderHistoryDetails(),arguments: singleData.id.toString());
                                  },
                                  leading:Container(
                                    width: 96,
                                    height: 80.93,
                                    decoration: const BoxDecoration(
                                    ),
                                    child:  Lottie.asset('assets/json/animation_lmahhli4.json'),
                                  ),
                                  title: Text(
                                    singleData.name.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF181725),
                                      fontSize: 18,
                                      fontFamily: 'General Sans',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),

                                  subtitle: Text(
                                    singleData.orderDatetime.toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF7C7C7C),
                                      fontSize: 16,
                                      fontFamily: 'General Sans',
                                      fontWeight: FontWeight.w400,
                                      height: 1.31,
                                    ),
                                  ) ,
                                  trailing: const Icon(Icons.arrow_forward_ios),

                                  dense: true,
                                  // padding: EdgeInsets.zero,
                                );
                              } , separatorBuilder: (context, index){
                            return const Divider(
                              thickness: 1,
                            );
                          }, )

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

            // Obx(()=>controller.OrderHistoryList.isEmpty?ProductNotFound():ListView.separated(
            //     shrinkWrap: true,
            //     itemBuilder:(context, index) {
            //     var singleData=controller.OrderHistoryList[index];
            //   return ListTile(
            //     onTap: () {
            //       Get.to(()=>const OrderHistoryDetails(),arguments: singleData["id"]);
            //     },
            //     leading:Container(
            //       width: 96,
            //       height: 80.93,
            //       decoration: const BoxDecoration(
            //       ),
            //       child:  Lottie.asset('assets/json/animation_lmahhli4.json'),
            //     ),
            //     title: Text(
            //       singleData['name'].toString(),
            //       style: const TextStyle(
            //         color: Color(0xFF181725),
            //         fontSize: 18,
            //         fontFamily: 'General Sans',
            //         fontWeight: FontWeight.w500,
            //       ),
            //     ),
            //
            //     subtitle: Text(
            //       singleData['date_order'].toString(),
            //       style: const TextStyle(
            //         color: Color(0xFF7C7C7C),
            //         fontSize: 16,
            //         fontFamily: 'General Sans',
            //         fontWeight: FontWeight.w400,
            //         height: 1.31,
            //       ),
            //     ) ,
            //     trailing: const Icon(Icons.arrow_forward_ios),
            //
            //     dense: true,
            //     // padding: EdgeInsets.zero,
            //   );
            // } , separatorBuilder: (context, index){
            //   return const Divider(
            //     thickness: 1,
            //   );
            // }, itemCount: controller.OrderHistoryList.length)),
          ],

        ),
      ) ,
    );
  }
}
