import 'package:flutter/material.dart';
import '../../constant/const_text.dart';

class HeadingText12Black extends StatelessWidget {
  const HeadingText12Black({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      style: ConstTextStyle().kBody12black400,
    );
  }
}

class HeadingText14Black extends StatelessWidget {
  const HeadingText14Black({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text.toString(),
      textAlign: TextAlign.left,
      style: ConstTextStyle().kBody14black600,//kBody15black600,
    );
  }
}


class HeadingText12MediumC7600Black extends StatelessWidget {
  const HeadingText12MediumC7600Black({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(text,
      textAlign: TextAlign.left,
      style: ConstTextStyle().kBody14blackC7600,//kBody15black600,
    );
  }
}