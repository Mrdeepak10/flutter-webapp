import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/controller/home_controller/home_controller.dart';
import '../../widgets/appBar.dart';
import '../../widgets/custom_textfield/search.dart';
import '../../widgets/product/product_grid.dart';
import '../../widgets/product/product_not_found.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final controller=Get.put(HomeController());

  @override
  void initState() {
    // TODO: implement initState
    controller.loading.value=false;
    controller.loadSearchHistory();
    controller.productSearchController.value.clear();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    //Size size =MediaQuery.of(context).size;
    return   Scaffold(
      appBar: appBar("Search", context),
      body:Obx(
          ()=> SafeArea(
            child:SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox(height: 20,),

                    CustomSearchField(
                      search: true,
                      hint: "Search here...",
                      controller: controller.productSearchController.value,
                      onTap: (){
                        controller.searchCategoryId.value=null.toString();
                      },
                      filter: true,
                      onSubmit: (text){
                        if(controller.productSearchController.value.text.isEmpty){}
                        else{

                          controller.Search.value=controller.productSearchController.value.text.toString();
                        }

                      }, onChanged: (text){

                        if(controller.productSearchController.value.text.isEmpty){}
                        else{

                          controller.Search.value=controller.productSearchController.value.text.toString();
                        }


                    },
                    ),

                    controller.productSearchController.value.text.toString().isEmpty ?Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 15,),
                        controller.searchHistory.isEmpty?SizedBox():Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Recent Search",//style: ConstText.heading16Text500,
                                ),
                                Spacer(),
                                GestureDetector(
                                    onTap: (){
                                      controller.clearSearchHistory();
                                    },
                                    child: Text("Clear All",//style: ConstText.heading16Text500,
                                    )),
                              ],
                            ),
                            SizedBox(height: 10,),
                            ListView.builder(
                              shrinkWrap: true,
                              physics: BouncingScrollPhysics(),
                              itemCount: controller.searchHistory.length==0?0:controller.searchHistory.length>3?3:controller.searchHistory.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(controller.searchHistory[index].query),
                                  onTap: () {
                                    // Handle the selection of a search history item
                                    controller.Search.value=  controller.productSearchController.value.text=controller.searchHistory[index].query.toString();
                                  },
                                  trailing: GestureDetector(
                                    onTap: (){
                                      //controller.clearSearchHistory();
                                    },
                                    child: Icon(Icons.history,color: Colors.grey,),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ):SizedBox(),

                    SizedBox(height: 10,),
                    controller.isLoading.value?Center(child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(color: Colors.red,),
                    )): controller.productSearchController.value.text.toString().isEmpty ?SizedBox() :controller.productSearchList.isEmpty?ProductNotFound():
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Search Found (${controller.productSearchList.length})",//style: ConstText.heading16Text500,
                        ),
                        SizedBox(height: 10,),
                        Scrollbar(
                          child:ProductGridView(home:  controller.productSearchList,

                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
      ),
      );
  }
}
