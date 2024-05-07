import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/model/home/home_model.dart' as model;

import '../../screen/product/product_by_cat.dart';
import '../text/heading_text.dart';
class HomeCat extends StatelessWidget {
  const HomeCat({super.key, required this.categoryModel});


  final List<model.Category> categoryModel;

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
            Get.to(()=>ProductCatSearch(CatId: data.id.toString(),CatName: data.name.toString()));
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  //color: Colors.white
              ),
              child: Padding(
                padding: const EdgeInsets.all(0.0),
                child: Column(
                  children: [
                    Container(
                     width:  80,height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.network("${data.image.toString()}",
                          fit: BoxFit.cover,
                        ),
                      ),

                    ),
                    SizedBox(height: 10,),
                    Expanded(child:HeadingTextBlack(title:"${data.name.toString()}")),
                  ],
                ),
              ),

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
