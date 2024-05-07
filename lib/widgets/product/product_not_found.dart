import 'package:flutter/material.dart';
import 'package:mandiweb/constant/constant_color.dart';

class ProductNotFound extends StatelessWidget {
  const ProductNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.only(top: 80),
      child: Center(
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.center,
          mainAxisAlignment:
          MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/basket.png",
              //width: Get.width,
              height: 250,
              //fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 10,
            ),
             Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 50),
              child: Text(
                "No Item Found",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorConst().blackC7,
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                )
                //kBody18mediumblack500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
