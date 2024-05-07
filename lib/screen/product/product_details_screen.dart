import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import 'package:readmore/readmore.dart';
import '../../constant/const_text.dart';
import '../../model/product_model/product_details_model.dart';
import '../../widgets/appBar.dart';
import '../../widgets/buttons/add_qty_button.dart';
import '../../widgets/product/product_list_view.dart';
import 'package:mandiweb/model/product_model/product_details.dart' as Prod;
import '../../widgets/text/price_text.dart';

class ProductDetailsPage extends StatefulWidget {
  const ProductDetailsPage({super.key, required this.id});

  final int id;
  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {

  final homeController =Get.put(HomeController());
  var id=Get.arguments;
  RxInt qty = 1.obs;
  RxInt itemQty = 1.obs;
  RxBool like = true.obs;
  late Prod.Products pro;

  Widget image(image)=>Container(
      height: MediaQuery.of(context).size.height * 0.270,
      width: Get.width,//MediaQuery.of(context).size.width,
      color: Colors.white,
      child:
      Image.network(image.toString(),fit: BoxFit.scaleDown,),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Product Details", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     GestureDetector(
              //       onTap:(){
              //         Get.back();
              //       },
              //       child: CircleAvatar(backgroundColor: Colors.white
              //           ,child: Icon(Icons.arrow_back_ios,color: Colors.black, size: 20,)),
              //     ),
              //    Text("Product Detail"),
              //    //appBar("Product Detail", context),
              //     //SizedBox(width: 5,),
              //     GestureDetector(
              //         onTap: (){},
              //         child: CircleAvatar(backgroundColor: Colors.white
              //             ,child: Badge(
              //                 child: Icon(Icons.shopping_bag,color: Colors.black, size: 20,)))
              //     ),
              //   ],
              // ),
              // SizedBox(height: 20,),

              FutureBuilder(
                  future: homeController.getProductDetails(id: widget.id),
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
                        ProductDetailsModel? home = snapshot.data as ProductDetailsModel;

                        return ListView.separated(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(),
                          itemCount:home.products!.length,
                          itemBuilder: (context, index) {
                            var singleData = home.products![0];
                             pro= Prod.Products(
                                id: singleData.id,
                                //price: widget.products.price,
                                image: singleData.image,
                                uom:singleData.uom,
                                listPrice: singleData.listPrice,
                                name: singleData.name,
                                stock: singleData.stock,
                                actualPrice: singleData.listPrice,
                                mrp: singleData.mrp,
                                actualDiscount: singleData.mrp,
                               taxAmount: double.parse(singleData.taxAmount.toString()),// double.parse(singleData.stock) * double.parse(singleData.taxAmount),
                               actualGst: double.parse(singleData.taxAmount.toString()),
                            );
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Stack(
                                //   children: [
                                    //singleData.image==null||singleData.image.toString().isEmpty?
                                    image(singleData.image),
                                    //productImage(context,[singleData.image]),
                                //   ],
                                // ),
                                const SizedBox(
                                  height: 15,
                                ),




                                //Product Name Container with price and rating
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24.0),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),

                                      Text(singleData.name.toString(),style: kHeading16Boldblack500,),
                                     // HeadingTextBlack(title:  singleData.name.toString(),),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(singleData.nameInHindi.toString(),style: kHeading16black500,),
                                      //UomText(uom:'1 ' + singleData.uom.toString(),),
                                      const SizedBox(
                                        height: 10,
                                      ),

                                     singleData.isPot==false||singleData.isPot=="false"?CommingSoon(): Column(
                                       crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text("₹"+singleData.listPrice.toString(),style: kHeading21Boldblack700,),
                                                PriceDetailDiscountText(price: singleData.mrp!.toString(),),
                                                const SizedBox(width : 5,),
                                                Container(
                                                  decoration:BoxDecoration(
                                                    borderRadius: BorderRadius.circular(4),
                                                    color: Color(0xffCF1C0C).withOpacity(0.15),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(4.0),
                                                    child: Text(
                                                      '${calculateDiscountPercentage(singleData.mrp!,singleData.listPrice!).floor()}% OFF',
                                                      style: TextStyle(
                                                        color: Color(0xffCF1C0C),
                                                        fontSize: 11,
                                                        fontFamily: 'inter',
                                                        fontWeight: FontWeight.w500,
                                                      ),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),

                                          const SizedBox(
                                            height: 10,
                                          ),
                                          //homeController.itemList.isEmpty?
                                          QtyScreen( productId: "${int.tryParse(singleData.id.toString())}",products: pro,),//:SizedBox(),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                        ],
                                      )

                                    ],

                                  ),
                                ),


                                Container(
                                  width: Get.width,
                                  decoration: BoxDecoration(
                                      color: Colors.white
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 12, bottom: 24, left: 24),
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            'Product Details',
                                            style:TextStyle()
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),

                                        ReadMoreText(
                                          '${singleData.description.toString()}',
                                          trimLines: 5,
                                          style: TextStyle(fontWeight: FontWeight.w400,
                                              fontSize: 12),
                                          colorClickableText: Colors.blue,
                                          trimMode: TrimMode.Line,
                                          trimCollapsedText: 'Show more',
                                          trimExpandedText: ' Show less',
                                        ),

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
      ),
      // bottomNavigationBar:Obx(()=>homeController.itemList.isEmpty ?SizedBox():
      //  QtyScreen( productId: id.toString(),products: pro,),),

    );
  }
}
