import 'package:flutter/material.dart';

import '../../constant/const_text.dart';

class HeadingTextBlack extends StatelessWidget {
  const HeadingTextBlack({Key? key, this.title="Product",})
      : super(key: key);


  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        title,
        textAlign: TextAlign.left,
        maxLines: 2,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style:kBody10lightblack500,
        // TextStyle(
        //     color: Color(0xff2B2B2B),
        //     fontSize: 10.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}

