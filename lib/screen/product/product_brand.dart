import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/widgets/appBar.dart';
import 'package:mandiweb/widgets/custom_card/custom_brand_card.dart';
import '../../controller/home_controller/home_controller.dart';
import '../../model/product_model/product_brand_model.dart';
import '../../widgets/product/product_not_found.dart';

class ProductBrand extends StatefulWidget {
  const ProductBrand({super.key});

  @override
  State<ProductBrand> createState() => _ProductBrandState();
}

class _ProductBrandState extends State<ProductBrand> {
  final homeController =Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("Shop by Brands", context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              FutureBuilder(
                  future: homeController.getBrand(),
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
                        BrandModel? home =
                        snapshot.data as BrandModel;
        
                        return home.brands.toString().isEmpty?ProductNotFound():CustomBrand(bradsModel:home.brands!);
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
              //CustomBrand(categoryModel:DummyData.brand)
            ],
        
          ),
        ),
      ),
    );
  }
}
