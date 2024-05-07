import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/screen/homescreen/home_screen.dart';

backLogoSvg() {
  return CircleAvatar(backgroundColor: Colors.white
      ,child: Icon(Icons.arrow_back_ios,color: Colors.black, size: 20,));
    //SvgPicture.asset("${Images.back}",height: 35,width: 35,);
}


appBar(String title, BuildContext context) {
  return AppBar(
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.transparent,
    leading: IconButton(
        onPressed: () {

            Get.to(()=>HomeScreen());

        },
        icon: backLogoSvg()),
    centerTitle: true,
    title: Text(title,
        style: Theme
            .of(context)
            .textTheme
            .titleLarge
            ?.copyWith(
            fontSize: 22,
            )),
  );
}
