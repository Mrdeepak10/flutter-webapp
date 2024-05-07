import 'package:flutter/material.dart';
import 'package:mandiweb/constant/constant_color.dart';

class CustomFButton extends StatelessWidget {
  const CustomFButton({Key? key, this.title="Add", required this.onTap})
      : super(key: key);


  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: TextButton(
          style:  ButtonStyle(
              backgroundColor:MaterialStateProperty.all<Color>( kPrimaryGreenColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )
              )
          ),
          onPressed: ()async{   onTap();
          }, child: Text(title,style:TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),)),
    );
  }
}


// class CustomDisableFButton extends StatelessWidget {
//   const CustomDisableFButton({Key? key, this.title="Add", required this.onTap})
//       : super(key: key);
//
//
//   final String title;
//   final Function onTap;
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 51,//MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
//       child: TextButton(
//           style:  ButtonStyle(
//               backgroundColor:MaterialStateProperty.all<Color>( ConstColor.darkGreenColors.withOpacity(.30)),
//               shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//                   RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(100),
//                   )
//               )
//           ),
//           onPressed: (){   onTap();
//           }, child: Text(title,style: ConstText.heading16Text500black.copyWith(fontWeight: FontWeight.w600,fontSize: 16,color: ConstColor.white),)),
//     );
//   }
// }

