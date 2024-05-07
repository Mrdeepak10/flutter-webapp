// import 'dart:developer';
// import 'dart:html' as html;
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:go_router/go_router.dart';
// import 'package:mandiweb/route/app_names.dart';
// import 'package:mandiweb/screen/auth/login.dart';
// import 'package:mandiweb/screen/auth/otp.dart';
// import 'package:mandiweb/screen/cart/cart.dart';
// import 'package:mandiweb/screen/order_history/order_history.dart';
// import 'package:mandiweb/screen/order_history/order_history_details.dart';
// import 'package:mandiweb/widgets/custom_toaster.dart';
// import 'package:mandiweb/widgets/splash_screen.dart';
//
// import '../screen/homescreen/home_screen.dart';
//
// class AppRoute {
//
//   GoRouter route = GoRouter(
//       //initialLocation: '/',
//
//       //errorPageBuilder: (context, state) => MaterialPage(child: HomeScreen()),
//       routes: [
//         GoRoute(
//             name: RouteName.initial,
//             path: '/',
//             builder: (BuildContext context, GoRouterState state) {
//               return  SplashScreen();
//             },
//             // pageBuilder: (BuildContext context, GoRouterState state) {
//             //   return MaterialPage(child: SplashScreen());
//             //  },
//               routes: <RouteBase>[
//                 GoRoute(
//                   name: RouteName.homeScreen,
//                   path: 'homeScreen',
//                   builder: (BuildContext context, GoRouterState state) {
//                     return  HomeScreen();
//                   },
//                 ),
//
//                 GoRoute(
//                   name: RouteName.loginScreen,
//                   path: 'loginScreen',
//                   builder: (BuildContext context, GoRouterState state) {
//                     return  LoginScreen();
//                   },
//                 ),
//                 GoRoute(
//                   name: RouteName.otpScreen,
//                   path: 'otpScreen',
//                   builder: (BuildContext context, GoRouterState state) {
//                     return  OtpScreen();
//                   },
//                 ),
//                 GoRoute(
//                   name: RouteName.cartScreen,
//                   path: 'cartScreen',
//                   builder: (BuildContext context, GoRouterState state) {
//                     return  CartScreen();
//                   },
//                 ),
//                 GoRoute(
//                   name: RouteName.orderHistory,
//                   path: 'orderHistory',
//                   builder: (BuildContext context, GoRouterState state) {
//                     return OrderHistory();
//                   },
//                 ),
//
//                 GoRoute(
//                   name: RouteName.orderHistoryDetails,
//                   path: 'orderHistoryDetails',
//                   builder: (BuildContext context, GoRouterState state) {
//                     return  OrderHistoryDetails();
//                   },
//                 ),
//
//
//                 // GoRoute(
//                 //   name: RouteName.home,
//                 //   path: 'shop',
//                 //   builder: (context, state) {
//                 //     // Extract query parameters from the route
//                 //     final queryParams = state.uri.queryParameters;
//                 //     final String? retailsName = queryParams['retailsName'];
//                 //     final int? warehouseId = int.tryParse(queryParams['warehouseId'] ?? '');
//                 //     final int? sellerId = int.tryParse(queryParams['sellerId'] ?? '');
//                 //
//                 //     if (retailsName != null) {
//                 //       // Do something with retailsName
//                 //       GetStorage().write(
//                 //           'retailsName', retailsName.toString().replaceAll("_", " ").replaceAll('[','' ).replaceAll(']', ''));
//                 //       print('Retails Name: $retailsName');
//                 //     }
//                 //     if (warehouseId != null) {
//                 //       // Do something with warehouseId
//                 //       GetStorage().write('warehouseId', warehouseId.toString().replaceAll('[','' ).replaceAll(']', ''));
//                 //       print('Warehouse ID: $warehouseId');
//                 //     }
//                 //     if (sellerId != null) {
//                 //       // Do something with sellerId
//                 //       GetStorage().write('sellerId', sellerId.toString().replaceAll('[','' ).replaceAll(']', ''));
//                 //       print('Seller ID: $sellerId');
//                 //     }
//                 //     // Use the extracted parameters as needed
//                 //     return HomeScreen();
//                 //     //   ShopScreen(
//                 //     //   retailsName: retailsName,
//                 //     //   warehouseId: warehouseId,
//                 //     //   sellerId: sellerId,
//                 //     // );
//                 //   },
//                 // ),
//
//
//               ]
//         ),
//
//         GoRoute(
//           name: RouteName.home,
//           path: '/shop',
//           builder: (context, state) {
//             // Extract query parameters from the route
//             final queryParams = state.uri.queryParameters;
//             final String? retailsName = queryParams['retailsName'];
//             final int? warehouseId = int.tryParse(queryParams['warehouseId'] ?? '');
//             final int? sellerId = int.tryParse(queryParams['sellerId'] ?? '');
//
//             if (retailsName != null) {
//               // Do something with retailsName
//               GetStorage().write(
//                   'retailsName', retailsName.toString().replaceAll("_", " ").replaceAll('[','' ).replaceAll(']', ''));
//               print('Retails Name: $retailsName');
//             }
//             if (warehouseId != null) {
//               // Do something with warehouseId
//               GetStorage().write('warehouseId', warehouseId.toString().replaceAll('[','' ).replaceAll(']', ''));
//               print('Warehouse ID: $warehouseId');
//             }
//             if (sellerId != null) {
//               // Do something with sellerId
//               GetStorage().write('sellerId', sellerId.toString().replaceAll('[','' ).replaceAll(']', ''));
//               print('Seller ID: $sellerId');
//             }
//             // Use the extracted parameters as needed
//             return HomeScreen();
//             //   ShopScreen(
//             //   retailsName: retailsName,
//             //   warehouseId: warehouseId,
//             //   sellerId: sellerId,
//             // );
//           },
//         ),
//
//
//
//       ]);
// }
//
//
//
// class ShopScreen extends StatelessWidget {
//   final String? retailsName;
//   final int? warehouseId;
//   final int? sellerId;
//
//   const ShopScreen({
//     Key? key,
//     required this.retailsName,
//     required this.warehouseId,
//     required this.sellerId,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shop'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Retail Name: $retailsName'),
//             Text('Warehouse ID: $warehouseId'),
//             Text('Seller ID: $sellerId'),
//           ],
//         ),
//       ),
//     );
//   }
// }