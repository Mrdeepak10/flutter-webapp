import 'package:flutter/material.dart';
import '../../constant/const_text.dart';


class HeadingText8Black extends StatelessWidget {
  const HeadingText8Black({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:ConstTextStyle(). kBody8black400,
    );
  }
}


class HeadingTextBlack extends StatelessWidget {
  const HeadingTextBlack({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      style:ConstTextStyle(). kBody12black400,
    );
  }
}

class HeadingTextBlack14 extends StatelessWidget {
  const HeadingTextBlack14({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      style: ConstTextStyle().kBody14black600,//kBody15black600,
    );
  }
}

class HeadingTextBlack14Center extends StatelessWidget {
  const HeadingTextBlack14Center({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.center,
      style: ConstTextStyle().kBody14blackC7600,//kBody15black600,
    );
  }
}
class HeadingTextBlack16 extends StatelessWidget {
  const HeadingTextBlack16({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      style: ConstTextStyle().kBody16black600,//kBody15black600,
    );
  }
}

class HeadingTextBlack18 extends StatelessWidget {
  const HeadingTextBlack18({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      style: ConstTextStyle().kBody18black600,//kBody15black600,
    );
  }
}


class HeadingCatNameTextBlack18 extends StatelessWidget {
  const HeadingCatNameTextBlack18({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(text,
          textAlign: TextAlign.left,
          style: ConstTextStyle().kBody18black600,//kBody15black600,
        ),
        Spacer(),
        GestureDetector(
          onTap: (){
           // Get.to(() => const SelectProduct(), arguments: "$text",//"Fruits""Fruit"
           // );
          },
          child: Text(
            'See all',
            style: TextStyle(
              color: Color(0xFF53B175),
              fontSize: 16,
              fontFamily: 'General Sans',
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}