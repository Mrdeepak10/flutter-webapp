import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import '../../constant/const_image.dart';
import '../../constant/constant_color.dart';
import '../../widgets/appBar.dart';
import '../../widgets/custom_textfield/search.dart';
import '../../widgets/product/product_grid.dart';
import '../../widgets/product/product_not_found.dart';
import '../cart/cart.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key, required this.brand});

  final String brand;

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {

  final controller=Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    controller.loading.value=false;
    controller.seeAllSearch();
    controller.productSearchController.value.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //Size size =MediaQuery.of(context).size;
    return   Obx(
          ()=>  Scaffold(
        appBar: controller.productSearchController.value.text.isEmpty?appBar("${widget.brand}", context):appBar("${widget.brand}", context),
        body:Obx(
              ()=> SafeArea(
            child:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20,),

                    CustomSearchField(
                      search: true,
                      hint: "Search here...",
                      controller: controller.productSearchController.value,
                      onTap: (){
                        controller.searchCategoryId.value=null.toString();
                      },
                      filter: true,
                      onSubmit: (text){
                        if(controller.productSearchController.value.text.isEmpty){
                          controller.seeAllSearch();
                        }
                        else{

                          // controller.Search.value=controller.productSearchController.value.text.toString();
                          //controller.brandName.value=widget.brand.toString();
                          controller.see.value=controller.productSearchController.value.text.toString();

                        }

                      }, onChanged: (text){

                      if(controller.productSearchController.value.text.isEmpty){
                        controller.seeAllSearch();
                      }
                      else{

                        // controller.Search.value=controller.productSearchController.value.text.toString();
                        //controller.brandName.value=widget.brand.toString();
                        controller.see.value=controller.productSearchController.value.text.toString();

                      }


                    },
                    ),


                    SizedBox(height: 10,),
                    controller.isLoading.value?Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: Colors.red,),
                    )): controller.productSearchController.value.text.toString().isEmpty && controller.seeProductSearchList.isEmpty ?ProductNotFound():
                    controller.productSearchController.value.text.toString().isNotEmpty || controller.productSearchList.isNotEmpty?
                    //SizedBox() :controller.productBrandSearchList.isEmpty?
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Search Found (${controller.productSearchList.length})",//style: ConstText.heading16Text500,
                        ),
                        SizedBox(height: 10,),
                        Scrollbar(
                          child:ProductGridView(home:  controller.productSearchList,

                          ),
                        ),
                      ],
                    ):Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Search Found (${controller.seeProductSearchList.length})",//style: ConstText.heading16Text500,
                        ),
                        SizedBox(height: 10,),
                        Scrollbar(
                          child:ProductGridView(home:  controller.seeProductSearchList,

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        bottomNavigationBar:Obx(()=>controller.itemList.isEmpty ?SizedBox():GestureDetector(
          onTap: (){
            Get.to(()=>CartScreen());
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SafeArea(
              child: Container(

                height: 55,
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: kPrimaryGreenColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //if (itemAvailableInCart)
                      SvgPicture.asset(Constimage.cart,color: kwhitecolor,),
                      Obx(()=> Text("${controller.itemList.length} items",
                        style: TextStyle(color: kwhitecolor,fontSize: 12.0,),
                      ),),
                      Text(
                        'Total: \₹${controller.itemSum.value}', // You can replace this with your actual total
                        style: TextStyle(fontSize: 12.0,color: kwhitecolor),
                      ),
                    ],
                  ),
                ),
              ),
            ),//CartBottomBar(itemAvailableInCart: true, onTap: () {  },),
          ),
        )),
      ),
    );
  }
}
