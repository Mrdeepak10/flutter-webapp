import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:mandiweb/constant/const_image.dart';
import 'package:mandiweb/model/home/home_model.dart';
import 'package:mandiweb/widgets/custom_card/custom_home_brand.dart';
import '../../constant/const_text.dart';
import '../../constant/constant_color.dart';
import '../../controller/home_controller/home_controller.dart';
import '../../widgets/custom_card/custom_category.dart';
import '../../widgets/custom_textfield/search.dart';
import '../../widgets/product/product_list_view.dart';
import '../../widgets/product_image/product_images.dart';
import '../../widgets/slide_menu.dart';
import '../../widgets/text/category_heading.dart';
import '../cart/cart.dart';
import '../search/search.dart';


class HomeScreen extends StatefulWidget {
   HomeScreen ({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeController =Get.put(HomeController());

  final GlobalKey<ScaffoldState> men2 = GlobalKey<ScaffoldState>();

  final GlobalKey<ScaffoldState> men3 = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Show bottom sheet after the frame is rendered
      //html.window.location.reload();
      //  showBottomSheet(context);


    });
  }


  void showBottomSheet(BuildContext context) {

    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: Container(
            height: 600.0,
            width: Get.width,
            //color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                // Center(
                //   child:Image.asset(ImagesConst().logo.toString()),
                // ),
                SizedBox(height: 30,),

                Center(
                  // color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Text("For Better Experience Download App" , style: kHeading21Boldblack700, textAlign: TextAlign.center,),
                      ),

                      const SizedBox(
                        height: 20,
                      ),

                      SizedBox(
                          //width: 95,
                          //height: 95,
                          child: Image.asset(Constimage.logo)),




                      const SizedBox(
                        height: 40,
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 51,
                          // height: MediaQuery.of(context).size.height,
                          width: MediaQuery.of(context).size.width,
                          child: TextButton(
                              style:  ButtonStyle(
                                  backgroundColor:MaterialStateProperty.all<Color>( kPrimaryGreenColor),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100),
                                      )
                                  )
                              ),
                              onPressed: ()async{   //installApp(context);
                              }, child: Text("Download",style:TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),)),
                        )

                        // CustomFButton(title: "Download",onTap: ()async{
                        //   installApp(context);
                        //   //installApp();
                        //   },
                        // ),
                      ),

                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );


  }




  @override
  Widget build(BuildContext context) {
    return homeController.api.localStorage.read("warehouseId")==null?
    // WillPopScope(
    //   onWillPop: () async => false,
    PopScope(
      //forbidden swipe from userGestureInProgress
      canPop: false,
      child: Scaffold(
        key: men2,
        drawer: SlideMenu(),
        drawerEnableOpenDragGesture: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: (){
                          print("printer is working");
                          men2.currentState!.openDrawer();
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Image.asset(Constimage.hamburger,height: 25,width: 25,),
                        ),
                      ),
                      //SizedBox(width: 5,),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Column(

                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                  width: 75,
                                  height: 75,
                                  child: Image.asset(Constimage.logo)),
                              Text("Welcome to Mymandi Store ",
                                  textAlign: TextAlign.center,
                                  style:TextStyle(fontWeight:FontWeight.w700,fontSize: 8,color: Color(0xff8A8A8A),


                                  )),

                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),

                  Icon(Icons.qr_code,size: 200,),

                  Text("Scan Mymandi Qr code of Retails to find Product ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorConst().kBlack
                    ),
                  ),

                  SizedBox(height: 090,),




                ],
              ),
            ),
          ),
        ),

      ),
    ):

    //WillPopScope(
      //onWillPop: () async => false,
    PopScope(
      //forbidden swipe from userGestureInProgress
      canPop: false,
      //onWillPop: () async => !(Navigator.of(context).userGestureInProgress),
      child: Scaffold(
        key: men3,
        drawer: SlideMenu(),
        drawerEnableOpenDragGesture: false,
        body:  SafeArea(
          child: SingleChildScrollView(

            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  appBarUi(),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: (){
                      Get.to(()=>SearchScreen());
                    },
                    child: CustomSearchField(
                      enable: false,
                      search: true,
                      hint: 'Search for groceries and more',
                      onSubmit: (text){}, onChanged: (text){
                    },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),

                  Data(),

                  SizedBox(height: 090,),




                ],
              ),
            ),
          ),
        ),

        bottomNavigationBar: Obx(()=>homeController.itemList.isEmpty ?SizedBox():GestureDetector(
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
                  borderRadius: BorderRadius.circular(4),
                  color: kPrimaryGreenColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //if (itemAvailableInCart)
                      //SvgPicture.asset(Constimage.cart,color: kwhitecolor,),
                      Obx(()=> Row(
                        children: [
                          Icon(Icons.shopping_cart_rounded,color: kwhitecolor),
                          SizedBox(width: 5,),
                          Row(
                            children: [
                              Icon(Icons.arrow_drop_up_outlined,color: kwhitecolor),
                              Text("${homeController.itemList.length} items",
                                style: TextStyle(color: Colors.white,fontSize: 12.0,),
                              ),
                            ],
                          ),
                        ],
                      ),),

                      ElevatedButton(
                        onPressed: () {
                          Get.to(()=>CartScreen());
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff1D8248),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),

                          ),
                        ),
                        child: const Text('Next',style: TextStyle(color: kwhitecolor),),
                      ),
                      // Text(
                      //   'Total: \₹${double.parse(homeController.itemSum.value).toStringAsFixed(2)}', // You can replace this with your actual total
                      //   style: TextStyle(fontSize: 12.0,color: kwhitecolor),
                      // ),
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



  Widget appBarUi()=> Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          men3.currentState!.openDrawer();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset(Constimage.hamburger,height: 25,width: 25,),
        ),
      ),
      SizedBox(width: 5,),

      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 95,
                  height: 95,
                  child: Image.asset(Constimage.logo)),
              Text("Welcome to ${homeController.api.localStorage.read("retailsName")==null?"Mymandi Store":homeController.api.localStorage.read("retailsName")}",
                  textAlign: TextAlign.center,
                  style:TextStyle(fontWeight:FontWeight.w700,fontSize: 12,color: Color(0xff8A8A8A),
                  )),

            ],
          ),
        ),
      ),
    ],
  );

  Widget Data()=>FutureBuilder(
      future:   homeController.getHome(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Internet Connection issue occurred',
                //'${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            HomeModel? home =
            snapshot.data as HomeModel;

            return Column(
              children: [
                imageBanner(context,home.products![0].banner!),
                SizedBox(height: 20,),
                HeadingCatNameTextBlack18(text: 'Exclusive Brands',),
                SizedBox(height: 20,),
                Container(
                    child:  HomeBrand(categoryModel:home.products![0].executive!) ,
                    height: 80

                ),
                SizedBox(height: 20,),

                home.products![0].dailyNeed==null?SizedBox(): Column(
                  children: [
                    HeadingCatNameTextBlack18(text: 'Fresh products',),
                    SizedBox(height: 20,),
                    Container(
                        height: 224,
                        child: ProductDListCard(productModel: home.products![0].dailyNeed!, //text: 'Popular Items',
                        )),
                    SizedBox(height: 20,),
                  ],
                ),

                home.products![0].category==null?SizedBox():Column(
                  children: [
                    HeadingCatNameTextBlack18(text: 'Categories',),
                    SizedBox(height: 20,),
                    Container(
                      child: CustomHomeCat(categoryModel:home.products![0].category!) ,// HomeCat (categoryModel:home.products![0].category!) ,
                      height: 270,// MediaQuery.of(context).size.height * 0.300

                    ),
                    // SizedBox(height: 20,),
                  ],
                ),

                home.products![0].promotionalBanner==null?SizedBox():Column(
                  children: [
                    SizedBox(height: 20,),
                    HeadingCatNameTextBlack18(text: 'Recommended',),
                    SizedBox(height: 20,),
                    imageProBanner(context,home.products![0].promotionalBanner!),
                  ],
                ),

                SizedBox(height: 20,),

                home.products![0].trending==null?SizedBox():Column(
                  children: [
                    HeadingCatNameTextBlack18(text: 'Popular Items',),
                    SizedBox(height: 20,),

                    Container(
                        height: 225,
                        child: ProductListCard(productModel: home.products![0].trending!, //text: 'Popular Items',
                        )),

                    SizedBox(height: 20,),
                  ],
                ),

                home.products![0].sponsored==null?SizedBox(): Column(
                  children: [
                    HeadingCatNameTextBlack18(text: 'Sponsored',),
                    SizedBox(height: 20,),
                    Container(
                        height: 225,
                        child: ProductSListCard(productModel: home.products![0].sponsored!, //text: 'Popular Items',
                        )),
                    SizedBox(height: 20,),
                  ],
                ),
                //SizedBox(height: 20,),

                SizedBox(height: 20,),
                home.products![0].sponsored==null?SizedBox(): Column(
                  children: [
                    HeadingCatNameTextBlack18(text: 'New Arrivals',),
                    SizedBox(height: 20,),
                    Container(
                        height: 225,
                        child: ProductFListCard(productModel: home.products![0].feature!, //text: 'Popular Items',
                        )),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Ek Naya Bharat",style: TextStyle(
                            fontSize: 60,
                            fontFamily: 'inter',
                            color: Color(0xffD1D5DB)
                          ),
                        ),
                        SizedBox(
                            width:150,
                            height:150,
                            child: SvgPicture.asset(Constimage.flag)),
                      ],
                    ),
                  ],
                ),
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
      });




}
