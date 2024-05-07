import 'dart:developer';


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mandiweb/model/home/home_model.dart' as banne;



final CarouselController _controller = CarouselController();
RxInt _current = 0.obs;
int? _current1;


Widget imageBanner(context,List<banne.Banner> imageList) => Column(
  children: [

    Stack(
      children: [
        CarouselSlider(
          items: <Widget>[
            for (var i = 0; i < imageList.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height*0.100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageList[i].name.toString()),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: Colors.transparent),
                    borderRadius:  BorderRadius.circular(10)
                ),
              )
          ],
          carouselController: _controller,
          options: CarouselOptions(
            //  width: MediaQuery.of(context).size.width,
              height: 187,//MediaQuery.of(context).size.height * 0.208,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1,//2 / 8,
              onPageChanged: (index, reason) {
                _current1 = index;
                _current.value = _current1!.toInt();

              }),
        ),
      ],
    ),
    Obx(
          () => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  _controller.animateToPage(entry.key);
                },
                child: Container(
                  width: 16.0,
                  height: 12.0,
                  margin: const EdgeInsets.only(
                      top: 8.0, left: 4.0, right: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                    (Theme.of(context).brightness == Brightness.dark
                        ? Colors.green
                        : Colors.grey)
                        .withOpacity(
                        _current.value == entry.key ? 0.9 : 0.2),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    )
  ],
);


Widget imageProBanner(context,List<banne.PromotionalBanner> imageList) => Column(
  children: [

    Stack(
      children: [
        CarouselSlider(
          items: <Widget>[
            for (var i = 0; i < imageList.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height*0.100,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageList[i].name.toString()),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: Colors.transparent),
                    borderRadius:  BorderRadius.circular(10)
                ),
              )
          ],
          carouselController: _controller,
          options: CarouselOptions(
            //  width: MediaQuery.of(context).size.width,
              height: 187,// MediaQuery.of(context).size.height * 0.177,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1,//2 / 8,
              onPageChanged: (index, reason) {
                _current1 = index;
                _current.value = _current1!.toInt();

              }),
        ),
      ],
    ),
    Obx(
          () => Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: imageList.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () {
                  _controller.animateToPage(entry.key);
                },
                child: Container(
                  width: 16.0,
                  height: 12.0,
                  margin: const EdgeInsets.only(
                      top: 8.0, left: 4.0, right: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                    (Theme.of(context).brightness == Brightness.dark
                        ? Colors.green
                        : Colors.grey)
                        .withOpacity(
                        _current.value == entry.key ? 0.9 : 0.2),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    )
  ],
);




Widget productImage(context,List imageList) => Column(
  children: [


    Stack(
      children: [
        CarouselSlider(
          items: <Widget>[
            for (var i = 0; i < imageList.length; i++)
              Container(
                width: MediaQuery.of(context).size.width,
                //  height: MediaQuery.of(context).size.height*0.200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(imageList[i]),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(color: Colors.transparent),
                    borderRadius:  BorderRadius.circular(10)
                ),
              )
          ],
          carouselController: _controller,
          options: CarouselOptions(
            //  width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.248,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: 1,
              aspectRatio: 1,//2 / 8,
              onPageChanged: (index, reason) {
                //  setState(() {
                _current1 = index;
                log("index"+index.toString());
                _current.value = _current1!.toInt();
                log("index "+_current.value.toString());


                // });
              }),
        ),
      ],
    ),




    Obx(
          () =>
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:  Row(
                children:[
                  for (var i = 0; i < imageList.length; i++)
                    GestureDetector(
                      onTap: () {
                        _controller.animateToPage(i);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color:
                              _current.value == i ?Colors.blue:(Theme.of(context).brightness == Brightness.dark
                                  ? Colors.green
                                  : Colors.grey)
                                  .withOpacity(
                                  _current.value == i ? 0.9 : 0.2),
                              border: Border.all(color: Colors.transparent),
                              borderRadius:  BorderRadius.circular(20)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 75,// MediaQuery.of(context).size.width,
                              height: 75,// MediaQuery.of(context).size.height*0.200,
                              decoration: BoxDecoration(
                                  color:
                                  _current.value == i ?Colors.blue:(Theme.of(context).brightness == Brightness.dark
                                      ? Colors.green
                                      : Colors.grey)
                                      .withOpacity(
                                      _current.value == i ? 0.9 : 0.2),
                                  image: DecorationImage(
                                    image: NetworkImage(imageList[i]),
                                    fit: BoxFit.scaleDown,
                                  ),
                                  border: Border.all(color: Colors.transparent),
                                  borderRadius:  BorderRadius.circular(10)
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                ],),
            ),
          ),
    ),


    // Obx(
    //       () =>
    //       Align(
    //         alignment: Alignment.bottomLeft,
    //         child: Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: imageList.asMap().entries.map((entry) {
    //               return GestureDetector(
    //                 onTap: () {
    //                   _controller.animateToPage(entry.key);
    //                 },
    //
    //
    //                 child:Column(
    //                   children:[
    //                     for (var i = 0; i < imageList.length; i++)
    //                       Container(
    //                         width: 75,// MediaQuery.of(context).size.width,
    //                         height: 75,// MediaQuery.of(context).size.height*0.200,
    //                         decoration: BoxDecoration(
    //                             color:
    //                             (Theme.of(context).brightness == Brightness.dark
    //                                 ? Colors.green
    //                                 : Colors.grey)
    //                                 .withOpacity(
    //                                 _current.value == entry.key ? 0.9 : 0.2),
    //                             image: DecorationImage(
    //                               image: NetworkImage(imageList[i]),
    //                               fit: BoxFit.scaleDown,
    //                             ),
    //                             border: Border.all(color: Colors.transparent),
    //                             borderRadius:  BorderRadius.circular(10)
    //                         ),
    //                       )
    //                   ],),
    //               );
    //             }).toList(),
    //           ),
    //         ),
    //       ),
    // ),


    //// dot indicator


    // Obx(
    //       () => Align(
    //     alignment: Alignment.bottomLeft,
    //     child: Padding(
    //       padding: const EdgeInsets.all(8.0),
    //       child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: imageList.asMap().entries.map((entry) {
    //           return GestureDetector(
    //             onTap: () {
    //               _controller.animateToPage(entry.key);
    //             },
    //             child: Container(
    //               width: 16.0,
    //               height: 12.0,
    //               margin: const EdgeInsets.only(
    //                   top: 8.0, left: 4.0, right: 4),
    //               decoration: BoxDecoration(
    //                 shape: BoxShape.circle,
    //                 color:
    //                 (Theme.of(context).brightness == Brightness.dark
    //                     ? ConstColor.greenColor
    //                     : ConstColor.greyLightColor)
    //                     .withOpacity(
    //                     _current.value == entry.key ? 0.9 : 0.2),
    //               ),
    //             ),
    //           );
    //         }).toList(),
    //       ),
    //     ),
    //   ),
    // )
  ],
);



String getFileExtensionFromUrl(String url) {
  Uri uri = Uri.parse(url);
  String path = uri.path;
  List<String> segments = path.split('/');
  String lastSegment = segments.last;
  List<String> parts = lastSegment.split('.');
  if (parts.length > 1) {
    return parts.last;
  }
  return ''; // If no file extension found
}