import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/constant/constant_color.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';

class CartBottomBar extends StatelessWidget {
  final bool itemAvailableInCart;
  final VoidCallback onTap;

  const CartBottomBar({
    Key? key,
    required this.itemAvailableInCart,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BottomAppBar(
      shape:CustomNotchedShape(),
      child: Container(

        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: kwhitecolor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (itemAvailableInCart)
              Obx(()=> Text("${HomeController().itemList.length}")),
              // TextButton(
              //   onPressed: onTap,
              //   style: TextButton.styleFrom(
              //     backgroundColor: Colors.blue,
              //     //primary: Colors.white,
              //   ),
              //   child: Text('Proceed to Checkout'),
              // ),
            Text(
              'Total: \$100', // You can replace this with your actual total
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}


class CustomNotchedShape extends NotchedShape {
  @override
  Path getOuterPath(Rect host, Rect? guest) {
    final path = Path();

    // Define your custom shape here
    path.moveTo(host.left, host.top);
    path.lineTo(host.left + host.width * 0.3, host.top);
    path.lineTo(host.right - host.width * 0.3, host.top);
    path.lineTo(host.right, host.top);
    path.lineTo(host.right, host.bottom);
    path.lineTo(host.left, host.bottom);
    path.close();

    return path;
  }
}
