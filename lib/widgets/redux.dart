// import 'package:flutter/material.dart';
// import 'package:flutter_redux/flutter_redux.dart';
// import 'package:redux/redux.dart';
//
// // Define product model
// class Product {
//   final int id;
//   final String name;
//   final double price;
//
//   Product({required this.id, required this.name, required this.price});
// }
//
// // Define actions
// enum CartAction { addToCart, removeFromCart, incrementQuantity, decrementQuantity }
//
// // Define reducers
// List<Product> cartReducer(List<Product> state, dynamic action) {
//   if (action is Product && action != CartAction.addToCart) {
//     // Handle removing a product from the cart
//     state.removeWhere((product) => product.id == action.id);
//     return List.from(state);
//   } else if (action is Product && action != CartAction.addToCart) {
//     // Handle adding a product to the cart
//     state.add(action);
//     return List.from(state);
//   } else if (action == CartAction.incrementQuantity) {
//     // Handle incrementing quantity of a product in the cart
//     // You'll need to implement this logic based on your specific requirements
//     // You might need to use a different data structure or update the state differently
//   } else if (action == CartAction.decrementQuantity) {
//     // Handle decrementing quantity of a product in the cart
//     // You'll need to implement this logic based on your specific requirements
//     // You might need to use a different data structure or update the state differently
//   }
//   return state;
// }
//
//
//
// class Redux extends StatelessWidget {
//   final Store<List<Product>> store;
//
//   Redux({required this.store});
//
//   @override
//   Widget build(BuildContext context) {
//     return StoreProvider<List<Product>>(
//       store: store,
//       child: MaterialApp(
//         home: MyHomePage(),
//       ),
//     );
//   }
// }
//
// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Shopping Cart'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text(
//               'Items in Cart:',
//             ),
//             StoreConnector<List<Product>, List<Product>>(
//               converter: (store) => store.state,
//               builder: (context, cart) {
//                 return Column(
//                   children: cart.map((product) => Text('${product.name} - \$${product.price}')).toList(),
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           // Dispatch action to add item to cart
//           StoreProvider.of<List<Product>>(context).dispatch(Product(
//             id: 1,
//             name: 'Product 1',
//             price: 10.0,
//           ));
//         },
//         tooltip: 'Add to Cart',
//         child: Icon(Icons.add_shopping_cart),
//       ),
//     );
//   }
// }
