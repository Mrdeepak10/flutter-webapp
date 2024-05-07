import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mandiweb/screen/homescreen/home_screen.dart';
import 'package:mandiweb/widgets/custom_toaster.dart';
import 'package:mandiweb/widgets/support.dart';

import '../constant/constant_color.dart';
import '../screen/about_me/about_me.dart';
import '../screen/auth/login.dart';
import '../screen/order_history/order_history.dart';
import 'list_title.dart';

class SlideMenu extends StatelessWidget {
  const SlideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final String? Token = GetStorage().read("authToken");

    return Drawer(
      backgroundColor: kPrimaryGreenColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 80),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        backgroundColor: kPrimaryTextColor,
                        radius: 48.0,
                        child: Icon(
                          Icons.person,
                          color: kwhitecolor,
                        ),
                      ),
                      const SizedBox(height: 16.0),

                      const SizedBox(height: 4),

                      GetStorage().read("name") == null
                          ? const Text(
                              "Hello Guest,",
                              style: TextStyle(color: kwhitecolor),
                            )
                          : Text("Hello , ${GetStorage().read("name")}"),
                      SizedBox(height: 4),
                      // Text(
                      //   "Build-Version : ${ApiUrl().buildVersion}",
                      //   style: TextStyle(color: kPrimaryTextColor),
                      // ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
                Divider(
                  thickness: 2,
                  color: kwhitecolor,
                ),
                ListTileScreen(
                  text: 'Account Info',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                    // Get.offAll(()=>const SaleExcutiveHome());
                  },
                  icons: Icons.home,
                ),

                // Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Outlet Details*',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                    // Get.offAll(()=> Profile());
                  },
                  icons: Icons.person,
                ),

                // Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Address Book',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                    // Get.offAll(()=> ProfileUpdate());
                  },
                  icons: Icons.perm_contact_cal_outlined,
                ),

                //const Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Open Order Status',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                    //  Get.offAll(()=>const ViewsAllOrder());
                  },
                  icons: Icons.shopping_bag,
                ),
                //const Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Order History',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                     // customToast(type: "error", message: "Not Allowed");
                       Get.to(()=>const OrderHistory());
                    }
                  },
                  icons: Icons.shopping_bag,
                ),
                // const Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Payments',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                    //  Get.offAll(()=>const ViewsAllOrder());
                  },
                  icons: Icons.shopping_bag,
                ),
                //const Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Notifications',
                  onTap: () {
                    //  Get.offAll(()=>const ViewsAllOrder());
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                  },
                  icons: Icons.shopping_bag,
                ),
                //const Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Cashback',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                    //  Get.offAll(()=>const ViewsAllOrder());
                  },
                  icons: Icons.shopping_bag,
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Divider(
                    thickness: 2,
                    color: kwhitecolor,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                ListTileScreen(
                  text: 'Settings',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      customToast(type: "error", message: "Not Allowed");
                    }
                    //  Get.offAll(()=>const ViewsAllOrder());
                  },
                  icons: Icons.shopping_bag,
                ),
                // const Divider(thickness: 2,),
                ListTileScreen(
                  text: 'About Us',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      Get.to(() => const AboutUs());
                    }
                  },
                  icons: Icons.add_business_outlined,
                ),
                // const Divider(thickness: 2,),
                //  ListTileScreen(
                //    text: 'App Permissions',
                //    onTap: (){
                //      //  Get.offAll(()=>const ViewsAllOrder());
                //    },
                //    icons: Icons.shopping_bag,),
                //const Divider(thickness: 2,),
                ListTileScreen(
                  text: 'Support',
                  onTap: () {
                    if (Token == null) {
                      // customToast(type: "error", message: "Login  Allowed");
                      Get.to(() => LoginScreen());
                    } else {
                      Get.to(() => const Support());
                    }
                  },
                  icons: Icons.shopping_bag,
                ),
              ],
            ),
            SizedBox(
              height: 100,
            ),
            Token == null
                ? Container(
                    height: 48,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => LoginScreen());
                        },
                        child: Row(
                          children: [
                            Text(
                              "Login".toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(
                              Icons.login,
                              color: kwhitecolor,
                            ),
                          ],
                        ),
                      ),
                    ))
                : Container(
                    height: 48,
                    width: 155,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.red,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 32),
                      child: GestureDetector(
                        onTap: () {
                          GetStorage().remove("authToken");
                          GetStorage().remove("username");
                          GetStorage().remove("usertype");
                          GetStorage().remove("CustomerId");
                          GetStorage().remove("authToken");
                          GetStorage().remove("partner_id");
                          GetStorage().remove("wmName");
                          GetStorage().remove("email");
                          GetStorage().remove("name");
                          GetStorage().remove("uid");
                          GetStorage().remove("usertype");
                          GetStorage().remove("wmId");

                          // CommonPop().logOutPop();
                          Get.offAll(() => HomeScreen());

                          //Get.offAll(()=>LoginScreen());
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.login,
                              color: kwhitecolor,
                            ),
                            Text(
                              "Logout".toUpperCase(),
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
