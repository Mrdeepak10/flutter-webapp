import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/constant/constant_color.dart';
import 'package:mandiweb/model/home/home_model.dart' as model;

import '../../screen/product/product_by_brand.dart';
import '../text/heading_text.dart';
class HomeBrand extends StatelessWidget {
  const HomeBrand({super.key, required this.categoryModel});


  final List<model.Executive> categoryModel;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: categoryModel.length,
      itemBuilder: (context,index){

        var data =categoryModel[index];
        return GestureDetector(
          onTap: (){
            Get.to(()=>ProductBrandSearch(brand: data.id.toString(),brandName: data.name,),arguments: data.id);
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Column(
              children: [

                Container(
                  color: kwhitecolor,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    child: Image.network(
                      "${data.image.toString()}", // Replace with your image URL
                      width: 54,
                      height: 54, // Adjust height as needed
                      fit: BoxFit.scaleDown, // Adjust the fit based on your requirements
                    ),
                  ),
                ),

                // Container(
                //   height: 80,width: 80,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(100),
                //   ),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Image.network("${data.image.toString()}",
                //     fit: BoxFit.scaleDown,
                //     ),
                //   ),
                //
                // ),
                SizedBox(height: 10,),
                Expanded(child: HeadingTextBlack(title:"${data.name.toString()}")),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context,index){
        return SizedBox(height: 10,);
      },
    );
  }
}


