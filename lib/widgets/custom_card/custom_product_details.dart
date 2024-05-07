

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';

import '../../constant/constant_color.dart';
import '../text/Heading14.dart';

Widget productDetails({required String title}) {
  return Container(

      width: Get.width,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(.3),

        // border: Border.all()
        boxShadow: [
          BoxShadow(
            color: ColorConst().black03.withOpacity(.7),
            offset: const Offset(
              5.0,
              5.0,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          BoxShadow(
            color: Colors.white,
            offset: const Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeadingText14Black(text: 'Product Details',),
          SizedBox(height: 20,),
          ReadMoreText(
            '${title.toString().isEmpty?"No details found":title.toString()}',
            trimMode: TrimMode.Length,
            trimLines: 7,
            trimLength: 240,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
            colorClickableText:ColorConst().kBlack,
            trimCollapsedText: '...Show more',
            trimExpandedText: ' show less',
          ),
        ],
      ));
}