import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/screen/product/product_brand.dart';
import 'package:mandiweb/screen/product/see_all.dart';

import '../../screen/product/product_cat.dart';

class HeadingCatNameTextBlack18 extends StatelessWidget {
  const HeadingCatNameTextBlack18({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,
          textAlign: TextAlign.left,
          style: TextStyle(
            color: Color(0xFF2B2B2B),
            fontSize: 16,
            fontFamily: 'General Sans',
            fontWeight: FontWeight.w600,
          ),//kBody15black600,
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
            if(text.toString()=="Exclusive Brands"){
              Get.to(()=>ProductBrand());}
            else if(text.toString()=="Categories"){
              Get.to(()=>ProductCat());}
            else {
              Get.to(()=>SeeAllScreen(brand: text.toString()));
            }
          },
          child: Text(
            'See all',
            style: TextStyle(
              color: Color(0xFF0D6EFD),
              fontSize: 12,
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}