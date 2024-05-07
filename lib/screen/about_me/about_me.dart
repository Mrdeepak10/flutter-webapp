import 'package:flutter/material.dart';
import '../../constant/const_image.dart';
import '../../widgets/appBar.dart';
import '../../widgets/text/custom_heading_text.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: appBar("About Us", context),
      body: SafeArea(
        child: Column(
          children: [
            const Divider(thickness: 1,color: Colors.black26,),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column( crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 37,
                    child: HeadingTextBlack18(text:
                    'About My Mandi\n\n',
                    ),
                  ),
                  Expanded(
                    flex: 0,
                    child: HeadingTextBlack14Center(text:
                    'My Mandi provides its Vendors a platform with multiple services increasing ease of business and enabling via technology.     \nSave time, Save money, Save Energy. All pre-ordered fresh produce delivered to place of business between 6am - 8am. Free transportation above minimum order. No need to visit over-crowded Mandis at 3am. Best sorted quality at low rates.\n\nUpgrade to branded hand-carts for stronger brand identification and quality appeal.\n\nTaking the local cart-pusher business online with My Mandi. Customers will be able to view Vendor location and inventory. Orders can be placed directly to specific vendors.',
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
            Row(  crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 150,width: 150,
                    child: Image.asset(Constimage().aboutus)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}