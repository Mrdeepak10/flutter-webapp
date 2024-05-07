import 'package:flutter/material.dart';
import 'package:mandiweb/widgets/appBar.dart';

class Support extends StatelessWidget {
  const Support({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Support", context),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                    child: Row(
                      children: [
                        const Text("Contact us on ",style: TextStyle()),
                        //Text("*",style: TextStyle().copyWith(color: Colors.red)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                    child: Text(
                     "+91-9993344445"
                    ),
                  ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 4),
                    child: Row(
                      children: [
                        const Text("E-mail us on ",style: TextStyle()),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16,horizontal: 24),
                    child: Text(
                        "info@mymandionline.com"
                    ),
                  ),

                ],
              ),
            ],
          ),
        ),
      ) ,
    );
  }
}
