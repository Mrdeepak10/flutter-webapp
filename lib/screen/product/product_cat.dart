import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import 'package:mandiweb/widgets/appBar.dart';
import 'package:mandiweb/widgets/custom_card/custom_category.dart';
import '../../model/category_model/category_model.dart';
import '../../widgets/product/product_not_found.dart';

class ProductCat extends StatefulWidget {
  const ProductCat({super.key});

  @override
  State<ProductCat> createState() => _ProductCatState();
}

class _ProductCatState extends State<ProductCat> {
  final homeController =Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Shop by Categories", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [

              FutureBuilder(
                  future: homeController.getCCategory(),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      // If we got an error

                      if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            '${snapshot.error} occurred',
                            style: TextStyle(fontSize: 18),
                          ),
                        );

                        // if we got our data
                      } else if (snapshot.hasData) {
                        // Extracting data from snapshot object
                        CategoryModel? home =
                        snapshot.data as CategoryModel;

                        return  home.category!.toString().isEmpty?ProductNotFound():CustomCat(categoryModel:home.category!);
                      }
                    }

                    // Displaying LoadingSpinner to indicate waiting state
                    return SizedBox(
                      height: MediaQuery.of(context).size.height / 1.3,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  }),


              SizedBox(height: 100,)

            ],
          ),
        ),
      ),
    );
  }
}

