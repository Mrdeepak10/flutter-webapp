import 'package:flutter/material.dart';
import 'package:mandiweb/constant/constant_color.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({Key? key, this.title="Add", required this.onTap})
      : super(key: key);


  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 51,
      // height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: TextButton.icon(
          style:  ButtonStyle(
              backgroundColor:MaterialStateProperty.all<Color>( kPrimaryGreenColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  )
              )
          ),
          onPressed: (){   onTap();
          }, icon: Icon(Icons.shopping_bag),
          label: Text(title,style:TextStyle(fontWeight: FontWeight.w600,fontSize: 14,color: Colors.white),)),
    );
  }
}
