import 'package:flutter/material.dart';

import '../../constant/const_text.dart';





class PriceText extends StatelessWidget {
  const PriceText({Key? key, this.price="1",})
      : super(key: key);


  final String price;
  @override
  Widget build(BuildContext context) {
    return Text(
      "₹${price.toString()}",
      textAlign: TextAlign.left,
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style:TextStyle(

          fontStyle: FontStyle.normal,
//color: Color(0xFF9CA39D),
          fontSize: 12.5,
          fontWeight: FontWeight.w400,
          height: 0,
          color: Color(0xFF0F1811))
    );
  }
}


class PriceDiscountText extends StatelessWidget {
  const PriceDiscountText({Key? key, this.price="1",})
      : super(key: key);


  final String price;
  @override
  Widget build(BuildContext context) {
    return Text(
      "₹${price.toString()}",
      textAlign: TextAlign.left,
      maxLines: 2,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      style:TextStyle(fontStyle: FontStyle.normal,
        color: Color(0xFF9CA39D),
        fontSize: 12.5,
        fontWeight: FontWeight.w400,
        decoration: TextDecoration.lineThrough,
        height: 0,
      )
    );
  }
}


class PriceDetailDiscountText extends StatelessWidget {
  const PriceDetailDiscountText({Key? key, this.price="1",})
      : super(key: key);


  final String price;
  @override
  Widget build(BuildContext context) {
    return Text(
        "₹${price.toString()}",
        textAlign: TextAlign.left,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style:kHeading12c7black400,
    );
  }
}

