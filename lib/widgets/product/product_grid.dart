import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import '../../constant/const_text.dart';
import '../../screen/product/product_details_screen.dart';
import '../buttons/add_qty_button.dart';
import '../text/heading_text.dart';
import '../text/price_text.dart';
import 'package:mandiweb/model/product_model/product_details.dart' as Prod;

import 'product_list_view.dart';


class ProductGridView extends StatefulWidget {
  const ProductGridView({super.key,required this.home});

 final RxList home ;

  @override
  State<ProductGridView> createState() => _ProductGridViewState();
}

class _ProductGridViewState extends State<ProductGridView> {

  final controller=Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return Obx(()=>//SingleChildScrollView(
      // child: Container(
      //   decoration: ShapeDecoration(
      //     color: Colors.transparent,
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(10),
      //     ),
      //     shadows: [
      //       BoxShadow(
      //         color: Color(0x01000000),
      //         blurRadius: 3.15,
      //         offset: Offset(0, 1.85),
      //         spreadRadius: 0,
      //       ),BoxShadow(
      //         color: Color(0x02000000),
      //         blurRadius: 6.52,
      //         offset: Offset(0, 8.15),
      //         spreadRadius: 0,
      //       ),BoxShadow(
      //         color: Color(0x02000000),
      //         blurRadius: 13,
      //         offset: Offset(0, 20),
      //         spreadRadius: 0,
      //       ),BoxShadow(
      //         color: Color(0x03000000),
      //         blurRadius: 25.48,
      //         offset: Offset(0, 38.52),
      //         spreadRadius: 0,
      //       ),BoxShadow(
      //         color: Color(0x03000000),
      //         blurRadius: 46.85,
      //         offset: Offset(0, 64.81),
      //         spreadRadius: 0,
      //       ),BoxShadow(
      //         color: Color(0x05000000),
      //         blurRadius: 80,
      //         offset: Offset(0, 100),
      //         spreadRadius: 0,
      //       )
      //     ],
      //   ),
      //   child:
         GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // number of items in each row
                mainAxisSpacing: 4.0, // spacing between rows
                crossAxisSpacing: 4.0,
                childAspectRatio : 0.70// spacing between columns
            ),
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: widget.home.length,
            itemBuilder: (ctx, index) {
              var singleData=widget.home[index];

              Prod.Products pro= Prod.Products(
                  id: singleData['id'],
                  //price: widget.products.price,
                  image: singleData['image'],
                  uom:singleData['uom'],
                  listPrice: singleData['list_price'],
                  name: singleData['name'],
                  stock: singleData['stock'],
                  actualPrice: singleData['list_price'],
                  mrp: singleData['mrp'],
                  actualDiscount: singleData['mrp'],
                  taxAmount:double.parse(singleData['tax_amount'].toString()),// double.parse(singleData['stock'].toString()) * double.parse(singleData['tax_amount'].toString()),
                  actualGst: double.parse(singleData['tax_amount'].toString()),
              );

              return Container(
                height: 190,
               decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x01000000),
                      blurRadius: 3.15,
                      offset: Offset(0, 1.85),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x02000000),
                      blurRadius: 6.52,
                      offset: Offset(0, 8.15),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x02000000),
                      blurRadius: 13,
                      offset: Offset(0, 20),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x03000000),
                      blurRadius: 25.48,
                      offset: Offset(0, 38.52),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x03000000),
                      blurRadius: 46.85,
                      offset: Offset(0, 64.81),
                      spreadRadius: 0,
                    ),BoxShadow(
                      color: Color(0x05000000),
                      blurRadius: 80,
                      offset: Offset(0, 100),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap:(){
                          Get.to(()=>ProductDetailsPage(id: singleData["id"],),arguments: singleData["id"]);
                        },
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 20.0),
                                    child: Container(
                                      width:  Get.width,
                                      // height: size.height * 0.125,// 0.115,
                                      // decoration: BoxDecoration(
                                      //   color: Color(0xff9DA49E).withOpacity(.05),
                                      //   borderRadius: BorderRadius.circular(8),
                                      // ),
                                      child: CachedNetworkImage(
                                        height: 98.38,
                                        width: 98.38,
                                        imageUrl: "${singleData['image'].toString()}",
                                        fit: BoxFit.scaleDown,
                                        progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(),
                                        //CircularProgressIndicator(value: downloadProgress.progress),
                                        errorWidget: (context, url, error) => Icon(Icons.error),
                                      ),
                                    ),
                                  ),
                                  // Container(
                                  //   width: Get.width,
                                  //   height: size.height * 0.125,// 0.115,
                                  //   decoration: BoxDecoration(
                                  //     color: Color(0xff9DA49E).withOpacity(.05),
                                  //       borderRadius: BorderRadius.circular(8),
                                  //   ),
                                  //  child: Image.network(
                                  //      singleData['image'].toString(),fit: BoxFit.scaleDown,),
                                  // ),
                                  calculateDiscountPercentage(singleData['mrp'],singleData['list_price'])==0.0?SizedBox():
                                  Positioned(
                                    left: 10,
                                    top: 10,
                                    child: Container(
                                      width: 64.83,
                                      // height: 30,
                                      decoration:  BoxDecoration(
                                          color: Colors.redAccent,//Color(0xFFFDEFD5),
                                          borderRadius: BorderRadius.circular(24)
                                        // only(
                                        //   topLeft: Radius.circular(8),
                                        // )
                                      ),
                                      child:  Padding(
                                          padding: EdgeInsets.all(4.0),
                                          child:
                                          Text(
                                            '${calculateDiscountPercentage(singleData['mrp'],singleData['list_price']).floor()}% OFF',
                                            style: kBody12discount500,
                                            textAlign: TextAlign.center,
                                          )

                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 6,
                              ),
                              HeadingTextBlack(title:singleData['name'] ,),
                              const SizedBox(
                                height: 4,
                              ),
                             // UomText(uom:"1"+singleData['uom'].toString() ,),

                            ]
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0,left: 0,bottom: 8,right: 7),
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child:  singleData['is_pot']==false||singleData['is_pot']=="false" || singleData['stock']==0.0?CommingSoon():Row(
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  PriceText(price: singleData['list_price'].toString(),),
                                  SizedBox(height: 10,),
                                  PriceDiscountText(price: singleData['mrp'].toString(),),
                                ],
                              ),
                              Spacer(),
                              QtyScreen( productId: singleData['id'].toString(), products: pro,),
                              ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }),
    //  ),
    //)
    );
  }
}


