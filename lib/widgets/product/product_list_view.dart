import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/widgets/buttons/add_qty_button.dart';
import 'package:mandiweb/widgets/text/heading_text.dart';
import '../../constant/const_text.dart';
import '../../screen/product/product_details_screen.dart';
import '../text/price_text.dart';
import 'package:mandiweb/model/home/home_model.dart' as model;
import 'package:mandiweb/model/product_model/product_details.dart' as Prod;

class ProductListCard extends StatelessWidget {
  const ProductListCard({super.key, required this.productModel});


  final List<model.Trending> productModel;


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(2),
        scrollDirection: Axis.horizontal,
        itemCount:  productModel.length,
        //physics: NeverScrollableScrollPhysics(),
        keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (ctx, index) {
          var singleData=productModel[index];
          Prod.Products pro= Prod.Products(
              id: singleData.id,
              //price: widget.products.price,
              image: singleData.image,
              uom:singleData.uom,
              listPrice: singleData.listPrice,
              name: singleData.name,
              actualPrice: singleData.listPrice,
              stock: singleData.stock,
              mrp: singleData.mrp,
              actualDiscount: singleData.mrp,
              taxAmount: double.parse(singleData.taxAmount.toString()), // double.parse(singleData.stock.toString()) * double.parse(singleData.taxAmount.toString()),
              actualGst: double.parse(singleData.taxAmount.toString()),
          );

          return Container(
            height: 224,
            width: 160,//size.shortestSide/2 - 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.02),
              color: const Color(0xffffffff),
              border: Border.all(color: Color(0xffDADADA)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 20,),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>ProductDetailsPage(id: singleData.id,),arguments: singleData.id);
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
                                  imageUrl: "${singleData.image.toString()}",
                                  fit: BoxFit.scaleDown,
                                  progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(),
                                  //CircularProgressIndicator(value: downloadProgress.progress),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                            calculateDiscountPercentage(singleData.mrp,singleData.listPrice)==0.0?SizedBox():Positioned(
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
                                      '${calculateDiscountPercentage(singleData.mrp,singleData.listPrice).floor()}% OFF',
                                      style: kBody12discount500,
                                      // TextStyle(
                                      //   color: kwhitecolor,
                                      //   fontSize: 10,
                                      //   fontFamily: 'Poppins',
                                      //   fontWeight: FontWeight.w500,
                                      // ),
                                      textAlign: TextAlign.center,
                                    )

                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HeadingTextBlack(title: singleData.name.toString(),),
                        // const SizedBox(
                        //   height: 4,
                        // ),
                        // UomText(uom:'1 ' + singleData.uom ,),
                      ]
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0,left: 0,bottom: 8,right: 7),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: singleData.isPot==false||singleData.isPot=="false" || singleData.stock==0.0// singleData.stock==0.0||singleData.stock==0
                        ?CommingSoon():Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0,),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              PriceText(price: singleData.listPrice!.toString(),),
                              const SizedBox(height: 10,),
                              PriceDiscountText(price: singleData.mrp!.toString(),),
                            ],
                          ),
                        ),
                        //Spacer(),
                        singleData.isPot==false||singleData.isPot=="false" || singleData.stock==0.0 ?CommingSoon():
                        QtyScreen( productId: singleData.id.toString(),products: pro,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(2.0),
            child: SizedBox(
              width: 2,
            ),
          );
        },
      ),
    );
  }
}


class ProductSListCard extends StatelessWidget {
  const ProductSListCard({super.key, required this.productModel});


  final List<model.Sponsored> productModel;


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(2),
        scrollDirection: Axis.horizontal,
        itemCount:  productModel.length,
        //physics: NeverScrollableScrollPhysics(),
        keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (ctx, index) {
          var singleData=productModel[index];
          Prod.Products pro= Prod.Products(
              id: singleData.id,
              image: singleData.image,
              uom:singleData.uom,
              listPrice: singleData.listPrice,
              name: singleData.name,
              actualPrice: singleData.listPrice,
              stock: singleData.stock,
              mrp: singleData.mrp,
              actualDiscount: singleData.mrp,
              taxAmount: double.parse(singleData.taxAmount.toString()),// double.parse(singleData.stock.toString()) * double.parse(singleData.taxAmount.toString()),
            actualGst: double.parse(singleData.taxAmount.toString()),
          );

          return Container(
            height: 224,
            width: 160,//size.shortestSide/2 - 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.02),
              color: const Color(0xffffffff),
              border: Border.all(color: Color(0xffDADADA)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 20,),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>ProductDetailsPage(id: singleData.id,),arguments: singleData.id);
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
                                  imageUrl: "${singleData.image.toString()}",
                                  fit: BoxFit.scaleDown,
                                  progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(),
                                  //CircularProgressIndicator(value: downloadProgress.progress),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                            calculateDiscountPercentage(singleData.mrp,singleData.listPrice)==0.0?SizedBox():Positioned(
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
                                      '${calculateDiscountPercentage(singleData.mrp,singleData.listPrice).floor()}% OFF',
                                      style: kBody12discount500,
                                      // TextStyle(
                                      //   color: kwhitecolor,
                                      //   fontSize: 10,
                                      //   fontFamily: 'Poppins',
                                      //   fontWeight: FontWeight.w500,
                                      // ),
                                      textAlign: TextAlign.center,
                                    )

                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HeadingTextBlack(title: singleData.name.toString(),),
                        // const SizedBox(
                        //   height: 4,
                        // ),
                        // UomText(uom:'1 ' + singleData.uom ,),
                      ]
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0,left: 0,bottom: 8,right: 7),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: singleData.isPot==false||singleData.isPot=="false" || singleData.stock==0.0?CommingSoon(): Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              PriceText(price: singleData.listPrice!.toString(),),
                              const SizedBox(height: 10,),
                              PriceDiscountText(price: singleData.mrp!.toString(),),
                            ],
                          ),
                        ),
                        //Spacer(),
                        singleData.isPot==false||singleData.isPot=="false" || singleData.stock==0.0?CommingSoon():QtyScreen( productId: singleData.id.toString(),products: pro,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
          },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(2.0),
            child: SizedBox(
              width: 2,
            ),
          );
        },
      ),
    );
  }
}


class ProductDListCard extends StatelessWidget {
  const ProductDListCard({super.key, required this.productModel});


  final List<model.DailyNeed> productModel;


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(2),
        scrollDirection: Axis.horizontal,
        itemCount:  productModel.length,
        //physics: NeverScrollableScrollPhysics(),
        keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (ctx, index) {
          var singleData=productModel[index];
          Prod.Products pro= Prod.Products(
              id: singleData.id,
              image: singleData.image,
              uom:singleData.uom,
              listPrice: singleData.listPrice,
              name: singleData.name,
              actualPrice: singleData.listPrice,
              stock: singleData.stock,
              mrp: singleData.mrp,
              actualDiscount: singleData.mrp,
              taxAmount: double.parse(singleData.taxAmount.toString()),//double.parse(singleData.stock.toString()) * double.parse(singleData.taxAmount.toString()),
            actualGst: double.parse(singleData.taxAmount.toString()),
          );
          return Container(
            height: 224,
            width: 160,//size.shortestSide/2 - 25,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17.02),
                color: const Color(0xffffffff),
              border: Border.all(color: Color(0xffDADADA)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 20,),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>ProductDetailsPage(id: singleData.id,),arguments: singleData.id);
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
                                  imageUrl: "${singleData.image.toString()}",
                                  fit: BoxFit.scaleDown,
                                  progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(),
                                      //CircularProgressIndicator(value: downloadProgress.progress),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                            calculateDiscountPercentage(singleData.mrp,singleData.listPrice)==0.0?SizedBox():Positioned(
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
                                      '${calculateDiscountPercentage(singleData.mrp,singleData.listPrice).floor()}% OFF',
                                      style: kBody12discount500,
                                      // TextStyle(
                                      //   color: kwhitecolor,
                                      //   fontSize: 10,
                                      //   fontFamily: 'Poppins',
                                      //   fontWeight: FontWeight.w500,
                                      // ),
                                      textAlign: TextAlign.center,
                                    )

                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HeadingTextBlack(title: singleData.name.toString(),),
                        // const SizedBox(
                        //   height: 4,
                        // ),
                        // UomText(uom:'1 ' + singleData.uom ,),
                      ]
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0,left: 0,bottom: 8,right: 7),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:  singleData.isPot==false||singleData.isPot=="false" || singleData.stock==0.0?CommingSoon():Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              PriceText(price: singleData.listPrice!.toString(),),
                              const SizedBox(height: 10,),
                              PriceDiscountText(price: singleData.mrp!.toString(),),
                            ],
                          ),
                        ),
                        //Spacer(),
                        QtyScreen( productId: singleData.id.toString(),products: pro,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(2.0),
            child: SizedBox(
              width: 2,
            ),
          );
        },
      ),
    );
  }
}

class ProductFListCard extends StatelessWidget {
  const ProductFListCard({super.key, required this.productModel});


  final List<model.Feature> productModel;


  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SizedBox(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.all(2),
        scrollDirection: Axis.horizontal,
        itemCount:  productModel.length,
        //physics: NeverScrollableScrollPhysics(),
        keyboardDismissBehavior : ScrollViewKeyboardDismissBehavior.onDrag,
        itemBuilder: (ctx, index) {
          var singleData=productModel[index];
          Prod.Products pro= Prod.Products(
              id: singleData.id,
              //price: widget.products.price,
              image: singleData.image,
              uom:singleData.uom,
              listPrice: singleData.listPrice,
              name: singleData.name,
              actualPrice: singleData.listPrice,
              stock: singleData.stock,
              mrp: singleData.mrp,
              actualDiscount: singleData.mrp,
              taxAmount:  double.parse(singleData.taxAmount.toString()),//double.parse(singleData.stock.toString()) * double.parse(singleData.taxAmount.toString()),
            actualGst: double.parse(singleData.taxAmount.toString()),
          );

          return Container(
            height: 224,
            width: 160,//size.shortestSide/2 - 25,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(17.02),
              color: const Color(0xffffffff),
              border: Border.all(color: Color(0xffDADADA)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //SizedBox(height: 20,),
                GestureDetector(
                  onTap:(){
                    Get.to(()=>ProductDetailsPage(id: singleData.id,),arguments: singleData.id);
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
                                  imageUrl: "${singleData.image.toString()}",
                                  fit: BoxFit.scaleDown,
                                  progressIndicatorBuilder: (context, url, downloadProgress) => SizedBox(),
                                  //CircularProgressIndicator(value: downloadProgress.progress),
                                  errorWidget: (context, url, error) => Icon(Icons.error),
                                ),
                              ),
                            ),
                            calculateDiscountPercentage(singleData.mrp,singleData.listPrice)==0.0?SizedBox():Positioned(
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
                                      '${calculateDiscountPercentage(singleData.mrp,singleData.listPrice).floor()}% OFF',
                                      style: kBody12discount500,
                                      // TextStyle(
                                      //   color: kwhitecolor,
                                      //   fontSize: 10,
                                      //   fontFamily: 'Poppins',
                                      //   fontWeight: FontWeight.w500,
                                      // ),
                                      textAlign: TextAlign.center,
                                    )

                                ),
                              ),
                            ),

                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HeadingTextBlack(title: singleData.name.toString(),),
                        // const SizedBox(
                        //   height: 4,
                        // ),
                        // UomText(uom:'1 ' + singleData.uom ,),
                      ]
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 4.0,left: 0,bottom: 8,right: 7),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child:  singleData.isPot==false||singleData.isPot=="false" || singleData.stock==0.0?CommingSoon():Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            //mainAxisSize: MainAxisSize.min,
                            children: [
                              PriceText(price: singleData.listPrice!.toString(),),
                              const SizedBox(height: 10,),
                              PriceDiscountText(price: singleData.mrp!.toString(),),
                            ],
                          ),
                        ),
                        //Spacer(),
                        singleData.isPot==false||singleData.isPot=="false" || singleData.stock==0.0?CommingSoon():QtyScreen( productId: singleData.id.toString(),products: pro,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.all(2.0),
            child: SizedBox(
              width: 2,
            ),
          );
        },
      ),
    );
  }
}


// class BottomCart1 extends StatelessWidget {
//   const BottomCart1({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(()=>LocalDataController().itemList.isEmpty ?SizedBox():GestureDetector(
//       onTap: (){
//         Get.to(()=>CartScreen());
//       },
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: SafeArea(
//           child: Container(
//
//             height: 55,
//             padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(24),
//               color: kPrimaryGreenColor,
//             ),
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: <Widget>[
//                   //if (itemAvailableInCart)
//                   SvgPicture.asset(Constimage.cart,color: kwhitecolor,),
//                   Obx(()=> Text("${LocalDataController().itemList.length} items",
//                     style: TextStyle(color: kwhitecolor,fontSize: 12.0,),
//                   ),),
//                   Text(
//                     'Total: \₹${double.parse(LocalDataController().itemSum.value).toStringAsFixed(2)}', // You can replace this with your actual total
//                     style: TextStyle(fontSize: 12.0,color: kwhitecolor),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),//CartBottomBar(itemAvailableInCart: true, onTap: () {  },),
//       ),
//     ));
//   }
// }




double calculateDiscountPercentage(double mrp, double listPrice) {
  if (mrp <= 0 || listPrice <= 0 || mrp <= listPrice) {
    // Invalid input or no discount
    return 0.0;
  }

  // Calculate discount percentage
  double discountPercentage = ((mrp - listPrice) / mrp) * 100;
  return discountPercentage;
}