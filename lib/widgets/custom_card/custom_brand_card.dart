import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constant/constant_color.dart';
import '../../model/product_model/product_brand_model.dart'  as model;
import '../../screen/product/product_by_brand.dart';
import '../product_image/product_images.dart';

class CustomBrand extends StatelessWidget {
  const CustomBrand({super.key, required this.bradsModel});


  final List<model.Brands> bradsModel;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 2.0, // Adjust spacing as needed
          crossAxisSpacing: 3.0,
          childAspectRatio : 0.75,
      ),
      shrinkWrap: true,
      itemCount: bradsModel.length,
      itemBuilder: (context,index){

        var data =bradsModel[index];
        return GestureDetector(
          onTap: (){
            Get.to(()=>ProductBrandSearch(brand:data.id.toString(),brandName: data.name.toString(),));
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

                    if(data.image!=null)...[
                      if(getFileExtensionFromUrl(data.image.toString())!="avif")
                        SizedBox(
                            height: 100,
                            width: 100,
                            child: Image.network("${data.image}",fit: BoxFit.scaleDown,)),
                      SizedBox( height: 10,),
                    ],
                    //SizedBox(height: 5,),

                    Spacer(),
                    Text("${data.name}",style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kBlack
                    ),),
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
