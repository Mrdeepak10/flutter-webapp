import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../constant/constant_color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key,
    this.textInputType = TextInputType.text,
    this.search=false,
    this.cross=false,
    this.controller,
    this.hint,
    this.onTap,
    this.enable,

    //this.textInputFormatter,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool search;
  final bool cross;
  final String? hint;
  final TextInputType textInputType;
  final onTap;
  final enable;
  //final FilteringTextInputFormatter textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(

          enabled: enable,
          onTap: onTap,
          keyboardType: textInputType,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              border: InputBorder.none,

              isDense: true,
              counterText: '',
              hintText: hint,
              hintStyle: TextStyle(
                color: klightblack,
              ),
              prefixIcon: search?SvgPicture.asset("assets/images/Search.svg",color: klightblack,height: 15,width: 15,):null,
              suffixIcon: cross?const Icon(Icons.close_sharp):null,

              prefixIconConstraints: const BoxConstraints()),
        ),
      ),
    );
  }
}


class CustomPhoneTextField extends StatelessWidget {
  CustomPhoneTextField({Key? key,
    this.textInputType = TextInputType.text,
    this.phoneNumber=false,
    this.cross=false,
    this.controller,
    this.hint,
    this.onTap,
    this.enable,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool phoneNumber;
  final bool cross;
  final String? hint;
  final TextInputType textInputType;
  final onTap;
  final enable;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE2E2E2)),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          maxLength: 10,

          enabled: enable,
          onTap: onTap,
          keyboardType: textInputType,
          controller: controller,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
              border: InputBorder.none,

              isDense: true,
              counterText: '',
              hintText: hint,
              hintStyle: TextStyle(
                color: klightblack,
              ),
              prefixIcon: phoneNumber?Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text("+91",style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: kBlack,
                )),
              ):null,
              suffixIcon: cross?const Icon(Icons.close_sharp):null,

              prefixIconConstraints: const BoxConstraints()),
        ),
      ),
    );
  }
}


class CustomAadhaarTextField extends StatelessWidget {
  CustomAadhaarTextField({Key? key,
    this.textInputType = TextInputType.text,
    this.aadharIcon=false,
    this.cross=false,
    this.controller,
    this.hint,
    this.onTap,
    this.enable,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool aadharIcon;
  final bool cross;
  final String? hint;
  final TextInputType textInputType;
  final onTap;
  final enable;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding: const EdgeInsets.only(left: 1,),
      decoration:BoxDecoration(
        //gradient: LinearGradient(colors: [Colors.white,Colors.black38]),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: kMediumBlack),
      ),
      child: TextField(
        maxLength: 12,

        enabled: enable,
        onTap: onTap,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
            border: InputBorder.none,

            isDense: true,
            counterText: '',
            hintText: hint,
            hintStyle: TextStyle(
              color: klightblack,
            ),
            prefixIcon: aadharIcon?Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Icon(Icons.card_membership,size: 20,),
            ):null,
            suffixIcon: cross?const Icon(Icons.close_sharp):null,

            prefixIconConstraints: const BoxConstraints()),
      ),
    );
  }
}