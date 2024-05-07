import 'package:flutter/material.dart';
import '../constant/const_text.dart';
import '../constant/constant_color.dart';

class ListTileScreen extends StatelessWidget {
 const ListTileScreen({super.key,required this.text,required this.onTap,required this.icons});

  final Function onTap;
  final IconData icons;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onTap();
      },
      leading: Container(
        width: 24,
        height: 24,
        decoration: const BoxDecoration(),

        child: Icon(
          icons,
          size: 24,
          color: kmediumblackcolor1,
        ),
      ),
      title: Text(
          '$text',
          style: kBody16black500
      ),
      dense: true,
    );
  }
}