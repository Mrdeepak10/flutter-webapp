import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/constant/constant_color.dart';
import '../../constant/const_text.dart';
import '../../model/category_model/category_model.dart' as Cat;
import '../../screen/product/product_by_cat.dart';
import '../product_image/product_images.dart';
import 'package:mandiweb/model/home/home_model.dart' as HomeCat;

class CustomCat extends StatelessWidget {
  const CustomCat({super.key, required this.categoryModel});


  final List<Cat.Category> categoryModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2.0, // Adjust spacing as needed
        crossAxisSpacing: 3.0,
        childAspectRatio : 0.75,

        // Adjust spacing as needed
      ),
        shrinkWrap: true,
        itemCount: categoryModel.length,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemBuilder: (context,index){

          var data =categoryModel[index];

          return GestureDetector(
            onTap: (){
              Get.to(()=>ProductCatSearch(CatId: data.categoryId.toString(),CatName: data.categoryName.toString()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 2),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  color: Colors.white
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      // if(getFileExtensionFromUrl(data.categoryImage)=="avif")
                      //   AvifImage.network(
                      //     "${data.categoryImage}",
                      //     fit: BoxFit.cover, // Adjust the fit as needed
                      //   ),
                      if(data.categoryImage!=null)...[
                        if(getFileExtensionFromUrl(data.categoryImage)!="avif")
                          SizedBox(
                              height: 75,
                              width: 75,
                              child: Image.network("${data.categoryImage}",fit: BoxFit.scaleDown,)),
                        SizedBox( height: 10,),
                      ],
                      //SizedBox(height: 5,),

                      Spacer(),
                      Expanded(child: Text("${data.categoryName}",style: kBody10black500,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),),
                      // Text("${data.categoryName}",style: TextStyle(
                      //   fontSize: 12,
                      //   fontWeight: FontWeight.w400,
                      //   color: kBlack
                      // ),),
                    ],
                  ),
                ),

              ),
            ),
          );
        },
        );
  }
}



class CustomHomeCat extends StatelessWidget {
  const CustomHomeCat({super.key, required this.categoryModel});


  final List<HomeCat.Category> categoryModel;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
     // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 2.0, // Adjust spacing as needed
        crossAxisSpacing: 3.0,
        childAspectRatio : 0.75,//MediaQuery.of(context).size.height *0.9,// 0.85,

        // Adjust spacing as needed
    //  ),
      shrinkWrap: true,
      //itemCount: 8,//categoryModel.length,
      children: List.generate(8, (index) {
          var data =categoryModel[index];

          return GestureDetector(
          onTap: (){
    Get.to(()=>ProductCatSearch(CatId: data.id.toString(),CatName: data.name.toString()));
    },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // if(getFileExtensionFromUrl(data.categoryImage)=="avif")
            //   AvifImage.network(
            //     "${data.categoryImage}",
            //     fit: BoxFit.cover, // Adjust the fit as needed
            //   ),
            if(data.image!=null)...[
              if(getFileExtensionFromUrl(data.image)!="avif")
                Container(
                  color: kwhitecolor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    child: Image.network(
                      "${data.image.toString()}", // Replace with your image URL
                      width: 80,
                      height: 80, // Adjust height as needed
                      fit: BoxFit.scaleDown, // Adjust the fit based on your requirements
                    ),
                  ),
                ),
                // Container(
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8),
                //       color: Color(0xffEAF5FE)
                //   ),
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(8.0),
                //     child: SizedBox(
                //         height: 80,
                //         width: 80,
                //         child: Image.network("${data.image}",fit: BoxFit.scaleDown,)),
                //   ),
                // ),
              SizedBox( height: 5,),
            ],
            //SizedBox(height: 5,),

            //Spacer(),
            Expanded(child: Text("${data.name}",style: kBody10black500,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),)

          ],
        ),
      ),

    );}
      ),
      physics: NeverScrollableScrollPhysics(),
      // itemBuilder: (context,index){
      //
      //   var data =categoryModel[index];
      //
      //   return GestureDetector(
      //     onTap: (){
      //       Get.to(()=>ProductCatSearch(CatId: data.id.toString(),CatName: data.name.toString()));
      //     },
      //     child: Padding(
      //       padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         crossAxisAlignment: CrossAxisAlignment.center,
      //         children: [
      //           // if(getFileExtensionFromUrl(data.categoryImage)=="avif")
      //           //   AvifImage.network(
      //           //     "${data.categoryImage}",
      //           //     fit: BoxFit.cover, // Adjust the fit as needed
      //           //   ),
      //           if(data.image!=null)...[
      //             if(getFileExtensionFromUrl(data.image)!="avif")
      //               Container(
      //                 decoration: BoxDecoration(
      //                     borderRadius: BorderRadius.circular(8),
      //                     color: Color(0xffEAF5FE)
      //                 ),
      //                 child: SizedBox(
      //                     height: 80,
      //                     width: 80,
      //                     child: Image.network("${data.image}",fit: BoxFit.scaleDown,)),
      //               ),
      //             SizedBox( height: 5,),
      //           ],
      //           //SizedBox(height: 5,),
      //
      //           //Spacer(),
      //           Text("${data.name}",style: kBody10black500,
      //             textAlign: TextAlign.center,
      //           ),
      //         ],
      //       ),
      //     ),
      //   );
      // },
    );
  }
}
