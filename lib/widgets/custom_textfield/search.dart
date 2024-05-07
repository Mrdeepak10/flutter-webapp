import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
 const CustomSearchField({Key? key,
    this.textInputType = TextInputType.text,
    this.search=false,
    this.controller,
    this.hint,
    this.onTap,
    this.enable,
    this.filter=false,
    required this.onSubmit,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool search;
  final bool filter;
  final String? hint;
  final TextInputType textInputType;
  final onTap;
  final enable;
  final Function onSubmit;
  final Function onChanged;
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
          onSubmitted: (Text){
            onSubmit(Text);
          },
          onChanged: (text){
            onChanged(text);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            counterText: '',
            hintText: hint,
            hintStyle: const TextStyle(
              color: Color(0xFF7C7C7C),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            suffixIcon: search?const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search,size: 18,color: Colors.black),
            ):null,
            suffixIconConstraints: const BoxConstraints(),
          ),
        ),
      ),
    );
  }
}




class CustomSearchWithBorderField extends StatelessWidget {
 const CustomSearchWithBorderField({Key? key,
    this.textInputType = TextInputType.text,
    this.search=false,
    this.controller,
    this.hint,
    this.onTap,
    this.enable,
    this.filter=false,
    required this.onSubmit,
    required this.onChanged,
  }) : super(key: key);
  final TextEditingController? controller;
  final bool search;
  final bool filter;
  final String? hint;
  final TextInputType textInputType;
  final onTap;
  final enable;
  final Function onSubmit;
  final Function onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          // side: BorderSide(width: 1, color: Color(0xFFD9DADB)),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      // decoration: ShapeDecoration(
      //   shape: RoundedRectangleBorder(
      //     side: const BorderSide(width: 0.5, color: Color(0xFFD9D9D9)),
      //     borderRadius: BorderRadius.circular(5),
      //   ),
      //     color: ConstColor.white,
      //   shadows: [
      //   BoxShadow(
      //   color: Colors.black26,
      //   offset: const Offset(
      //     2.0,
      //     2.0,
      //   ),
      //   blurRadius: 2.0,
      //   spreadRadius: 1.0,
      // ), //BoxShadow
      // BoxShadow(
      //   color: Colors.white,
      //   offset: const Offset(0.0, 0.0),
      //   blurRadius: 0.0,
      //   spreadRadius: 0.0,
      // ), //BoxShadow
      // ],
      //  // color: Color(0xFFF1F2F2)
      // ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: TextField(
          enabled: enable,
          onTap: onTap,
          keyboardType: textInputType,
          controller: controller,
          onSubmitted: (Text){
            onSubmit(Text);
          },
          onChanged: (text){
            onChanged(text);
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            isDense: true,
            counterText: '',
            hintText: hint,
            hintStyle: TextStyle(
              color: Color(0x9902060C),
              fontSize: 15,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w200,
              height: 0.08,
              letterSpacing: -0.30,
            ),
            suffixIcon: search?const Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Icon(Icons.search,size: 18,color: Colors.black),
            ):null,
            suffixIconConstraints: const BoxConstraints(),
            // suffixIcon: filter? Padding(
            //   padding: EdgeInsets.only(right: 8.0),
            //   child: Image.asset(
            //       height:MediaQuery.of(context).size.height * 0.015,
            //       ConstImage.filter, color: filter?Colors.grey:Colors.black),
            // ):null,
            // suffixIconConstraints: const BoxConstraints()
          ),
        ),
      ),
    );
  }
}

