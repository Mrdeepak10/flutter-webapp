import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mandiweb/model/product_model/product_details.dart' as Prod;
import '../../controller/home_controller/home_controller.dart';

class QtyScreen extends StatefulWidget {
  const QtyScreen({
    Key? key,
    required this.productId,
    this.orderQty = 0,
    required this.products,
  }) : super(key: key);
  final String productId;
  final int orderQty;
  final Prod.Products products;
  @override
  State<QtyScreen> createState() => _QtyScreenState();
}

class _QtyScreenState extends State<QtyScreen> {
  final homeController = Get.put(HomeController());
  var quantity = "".obs;

  final box = GetStorage();

  Widget showWidget({qty}) {
    if (homeController.itemId.contains(widget.products.id) ||
        homeController.itemId.contains(widget.products.id.toString())) {
      int index = homeController.itemId.indexOf(widget.products.id);

      if (index != -1) {
        quantity.value = homeController.itemList[index].stock;
        double totalPrice = homeController.itemList
            .fold(0, (prev, product) => prev + (product.listPrice as double));
        homeController.itemSum.value = totalPrice.toString();
        double totalGst = homeController.itemList.fold(0, (prev, product) => prev + (product.taxAmount as double));
        homeController.itemGst.value=totalGst.toString();
        List<String> productListJson = homeController.itemList
            .map((product) => json.encode(product.toJson()))
            .toList();
        box.write('productList', productListJson);
      } else {}

      return Container(
        width: 60,
        height: 28,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Color(0xffEEFDF8),
            border: Border.all(color: Color(0xff6D8A7B))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: decrement,
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: Container(
                  //padding: const EdgeInsets.all(2.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child:
                      Icon(Icons.remove, size: 16, color: Color(0xff1D8248)),
                ),
              ),
            ),
            Text(
              quantity.value.toString(),
              style: TextStyle(fontSize: 10, color: Color(0xff1D8248)),
            ),
            GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(3),
                  child: Container(
                      //padding: const EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: const Icon(Icons.add,
                          size: 16, color: Color(0xff1D8248))),
                ),
                onTap: increment),
          ],
        ),
      );
    } else {
      if (qty == "0" || qty == 0) {
        return GestureDetector(
            onTap: increment,
            child: Container(
              width: 60,
              height: 28,
              //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffEEFDF8),
                  border: Border.all(color: Color(0xff6D8A7B))),
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Text(
                    "Add",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                        color: Color(0xff1D8248)),
                  )),
            ));
      } else {
        return
            // Obx(
            // () =>
            Container(
              width: 60,
              height: 28,
              //padding: EdgeInsets.symmetric(horizontal: 4,vertical: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xffEEFDF8),
                  border: Border.all(color: Color(0xff6D8A7B))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: decrement,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        //padding: const EdgeInsets.all(2.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Icon(Icons.remove,
                            size: 16, color: Color(0xff1D8248)),
                      ),
                    ),
                  ),
                  Text(
                    quantity.value.toString(),
                    style: TextStyle(fontSize: 10, color: Color(0xff1D8248)),
                  ),
                  GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                            //padding: const EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Icon(Icons.add,
                                size: 16, color: Color(0xff1D8248))),
                      ),
                      onTap: increment),
                ],
              ),
            );
        //);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    quantity.value = widget.orderQty.toString();
    return Obx(() => AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: showWidget(qty: quantity.value),
        ));
  }

  increment() async {
    // if (int.parse(quantity.value.toString()) >= 0) {
      quantity.value = (int.parse(quantity.value.toString()) + 1).toString();
      if (homeController.itemList.isEmpty) {

        Prod.Products pro = Prod.Products(
          id: widget.products.id,
          //price: widget.products.price,
          image: widget.products.image,
          uom: widget.products.uom,
          actualPrice: widget.products.actualPrice,
          listPrice: double.parse(widget.products.actualPrice.toString()) *
              double.parse(quantity.value.toString()),
          mrp: double.parse(widget.products.mrp.toString()) *
              double.parse(quantity.value.toString()),
          name: widget.products.name,
          stock: quantity.value,
          actualDiscount: widget.products.mrp,
          taxAmount: double.parse(quantity.value.toString()) * double.parse(widget.products.taxAmount.toString()),//widget.products.taxAmount,
          actualGst: double.parse(widget.products.taxAmount.toString()),
        );
        // Prod.Products pro = Prod.Products(
        //     id: widget.products.id,
        //     //price: widget.products.price,
        //     image: widget.products.image,
        //     uom: widget.products.uom,
        //     actualPrice: widget.products.actualPrice,
        //     listPrice: double.parse(widget.products.actualPrice.toString()) *
        //         double.parse(quantity.value.toString()),
        //     mrp: double.parse(widget.products.mrp.toString()) *
        //       double.parse(quantity.value.toString()),
        //     // listPrice: double.parse(widget.products.listPrice.toString()) * double.parse(quantity.value.toString()),
        //     // listPrice: widget.products.listPrice,
        //     name: widget.products.name,
        //     stock: quantity.value,
        //     taxAmount: double.parse(quantity.value.toString()) * double.parse(widget.products.taxAmount.toString()),// widget.products.taxAmount,
        //
        //     actualGst: double.parse(widget.products.taxAmount.toString())
        // );
        homeController.itemList.addAll({pro});
        homeController.itemId.addAll({widget.products.id});
        double totalPrice = homeController.itemList
            .fold(0, (prev, product) => prev + (product.listPrice as double));
        homeController.itemSum.value = totalPrice.toString();
        double totalPrice1 = homeController.itemList
            .fold(0, (prev, product) => prev + (product.mrp as double));
        homeController.itemMrp.value = totalPrice1.toString();
        double totalGst = homeController.itemList.fold(0, (prev, product) => prev + (product.taxAmount as double));
        homeController.itemGst.value=totalGst.toString();
        List<String> productListJson = homeController.itemList
            .map((product) => json.encode(product.toJson()))
            .toList();
        box.write('productList', productListJson);
        // print(homeController.itemList
        //     .map((product) => product.toJson())
        //     .toList());
      }
      else if (homeController.itemId.contains(widget.products.id)) {
        Prod.Products pro = Prod.Products(
            id: widget.products.id,
            //price: widget.products.price,
            image: widget.products.image,
            uom: widget.products.uom,
            actualPrice: widget.products.actualPrice,
            listPrice: double.parse(widget.products.actualPrice.toString()) *
                double.parse(quantity.value.toString()),
            mrp: double.parse(widget.products.mrp.toString()) *
                double.parse(quantity.value.toString()),
            name: widget.products.name,
            stock: quantity.value,
            actualDiscount: widget.products.mrp,
            taxAmount: double.parse(quantity.value.toString()) * double.parse(widget.products.taxAmount.toString()),//widget.products.taxAmount,
            actualGst: double.parse(widget.products.taxAmount.toString()),
        );

        int index = homeController.itemId.indexOf(widget.products.id);
        if (index != -1) {
          homeController.itemList[index] = pro;
         // homeController.itemId.insert(index, widget.products.id);
          //homeController.itemId.addAll({widget.products.id});
          double totalPrice = homeController.itemList
              .fold(0, (prev, product) => prev + (product.listPrice as double));
          homeController.itemSum.value = totalPrice.toString();
          double totalPrice1 = homeController.itemList
              .fold(0, (prev, product) => prev + (product.mrp as double));
          homeController.itemMrp.value = totalPrice1.toString();
          double totalGst = homeController.itemList.fold(0, (prev, product) => prev + (product.taxAmount as double));
          homeController.itemGst.value=totalGst.toString();
          List<String> productListJson = homeController.itemList
              .map((product) => json.encode(product.toJson()))
              .toList();
          box.write('productList', productListJson);
        } else {
          // print(
          //     'ID ${widget.products.id.toString()} not found in the list');
        }
        // print("present in" +
        //     homeController.itemList
        //         .map((product) => product.toJson())
        //         .toList()
        //         .toString());
      }
      else {
        Prod.Products pro = Prod.Products(
            id: widget.products.id,
            //price: widget.products.price,
            image: widget.products.image,
            uom: widget.products.uom,
            actualPrice: widget.products.actualPrice,
            listPrice: double.parse(widget.products.actualPrice.toString()) *
                double.parse(quantity.value.toString()),
            mrp: double.parse(widget.products.mrp.toString()) *
                double.parse(quantity.value.toString()),
            name: widget.products.name,
            stock: quantity.value,
            actualDiscount: widget.products.mrp,
            taxAmount: double.parse(quantity.value.toString()) * double.parse(widget.products.taxAmount.toString()),// widget.products.taxAmount,
            actualGst: double.parse(widget.products.taxAmount.toString()),
        );

        homeController.itemList.addAll({pro});
        homeController.itemId.addAll({widget.products.id});
        double totalPrice = homeController.itemList
            .fold(0, (prev, product) => prev + (product.listPrice as double));
        homeController.itemSum.value = totalPrice.toString();
        double totalPrice1 = homeController.itemList
            .fold(0, (prev, product) => prev + (product.mrp as double));
        homeController.itemMrp.value = totalPrice1.toString();
        double totalGst = homeController.itemList.fold(0, (prev, product) => prev + (product.taxAmount as double));
        homeController.itemGst.value=totalGst.toString();
        List<String> productListJson = homeController.itemList
            .map((product) => json.encode(product.toJson()))
            .toList();
        //box.write('productList', productListJson);
        box.write('productList', productListJson);
      }
    //}
  }

  decrement() async {
    //if ((int.parse(quantity.value.toString())) > 0) {
      quantity.value = (int.parse(quantity.value.toString()) - 1).toString();

      if (int.parse(quantity.value.toString()) == 0) {
        if (homeController.itemId.contains(widget.products.id)) {
          int index = homeController.itemId.indexOf(widget.products.id);
          if (index != -1) {
            homeController.itemList.removeAt(index);
            homeController.itemId.removeAt(index);
            double totalPrice = homeController.itemList.fold(
                0, (prev, product) => prev + (product.listPrice as double));
            homeController.itemSum.value = totalPrice.toString();
            double totalPrice1 = homeController.itemList
                .fold(0, (prev, product) => prev + (product.mrp as double));
            homeController.itemMrp.value = totalPrice1.toString();
            double totalGst = homeController.itemList.fold(0, (prev, product) => prev + (product.taxAmount as double));
            homeController.itemGst.value=totalGst.toString();
            List<String> productListJson = homeController.itemList
                .map((product) => json.encode(product.toJson()))
                .toList();
            log(homeController.itemList
                .map((product) => json.encode(product.toJson()))
                .toList().toString());
            box.write('productList', productListJson);
          } else {
            // print(
            //     'ID ${widget.products.id.toString()} not found in the list');
          }
        }
      }
      else {
        if (homeController.itemId.contains(widget.products.id)) {
          log(homeController.itemId.toString());
          Prod.Products pro = Prod.Products(
              id: widget.products.id,
              //price: widget.products.price,
              image: widget.products.image,
              uom: widget.products.uom,
              actualPrice: widget.products.actualPrice,
              listPrice: double.parse(widget.products.actualPrice.toString()) *
                  double.parse(quantity.value.toString()),
              name: widget.products.name,
              stock: quantity.value,
            mrp: double.parse(widget.products.mrp.toString()) *
                double.parse(quantity.value.toString()),
              actualDiscount: widget.products.mrp,
             taxAmount: double.parse(quantity.value.toString()) * double.parse(widget.products.taxAmount.toString()),
             actualGst: double.parse(widget.products.taxAmount.toString()),
          );

          int index = homeController.itemId.indexOf(widget.products.id);
          if (index != -1) {
            homeController.itemList[index] = pro;
            double totalPrice = homeController.itemList.fold(
                0, (prev, product) => prev + (product.listPrice as double));
            homeController.itemSum.value = totalPrice.toString();
            double totalPrice1 = homeController.itemList
                .fold(0, (prev, product) => prev + (product.mrp as double));
            homeController.itemMrp.value = totalPrice1.toString();
            double totalGst = homeController.itemList.fold(0, (prev, product) => prev + (product.taxAmount as double));
            homeController.itemGst.value=totalGst.toString();
            List<String> productListJson = homeController.itemList
                .map((product) => json.encode(product.toJson()))
                .toList();
            box.write('productList', productListJson);
          } else {
          }
        }
      }
   // }
  }
}


Widget CommingSoon() => Center(
  child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
        child: Container(
          //height: 76.83,
          width: Get.width,
          padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Color(0xffEEFDF8),
              border: Border.all(color: Color(0xff6D8A7B))),
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Text(
                "Coming Soon",
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: Color(0xff1D8248)),
              )),
        ),
      ),
);
