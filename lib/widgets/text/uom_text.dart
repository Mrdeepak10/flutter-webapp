

import 'package:flutter/material.dart';





class UomText extends StatelessWidget {
  const UomText({Key? key, this.uom="1 ml",})
      : super(key: key);


  final String uom;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "${uom.toString()}",
        textAlign: TextAlign.left,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style:TextStyle(fontSize: 12.0,
          fontStyle: FontStyle.normal,
//color: Color(0xFF9CA39D),




          color:Color(0xFF9CA39D),
          fontWeight: FontWeight.w400,
        )
      ),
    );
  }
}
