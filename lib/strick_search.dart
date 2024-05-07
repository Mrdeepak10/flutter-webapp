import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController _filter=TextEditingController ();

@override
Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxScrolled) {
          return <Widget>[
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200, filter: _filter),
              pinned: true,
            ),
          ];
        },
        body: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  title: Text(index.toString()),
                ),
              );
            })),
  );
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final TextEditingController filter;

  MySliverAppBar({required this.expandedHeight, required this.filter});

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    var searchBarOffset = expandedHeight - shrinkOffset - 20;
    return Stack(
      clipBehavior: Clip.none, fit: StackFit.expand,
      children: [
        Container(
          child: Image.network(
            'assets/mainBackImage.jpg',
            fit: BoxFit.cover,
          ),
        ),
        (shrinkOffset < expandedHeight - 20) ? Positioned(
          top: searchBarOffset,
          left: MediaQuery
              .of(context)
              .size
              .width / 4,
          child: Card(
            elevation: 10,
            child: SizedBox(
              height: 40,
              width: MediaQuery
                  .of(context)
                  .size
                  .width / 2,
              child: CupertinoTextField(
                controller: filter,
                keyboardType: TextInputType.text,
                placeholder: 'Search',
                placeholderStyle: TextStyle(
                  color: Color(0xffC4C6CC),
                  fontSize: 14.0,
                  fontFamily: 'Brutal',
                ),
                prefix: Padding(
                  padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                  child: Icon(
                    Icons.search,
                    size: 18,
                    color: Colors.black,
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ) : Container(
          margin: EdgeInsets.symmetric(
              horizontal: MediaQuery
                  .of(context)
                  .size
                  .width / 4,
              vertical: (kToolbarHeight - 40) / 4
          ),
          child: Card(
            elevation: 10,
            child: CupertinoTextField(
              controller: filter,
              keyboardType: TextInputType.text,
              placeholder: 'Search',
              placeholderStyle: TextStyle(
                color: Color(0xffC4C6CC),
                fontSize: 14.0,
                fontFamily: 'Brutal',
              ),
              prefix: Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                child: Icon(
                  Icons.search,
                  size: 18,
                  color: Colors.black,
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => throw UnimplementedError();

  @override
  // TODO: implement minExtent
  double get minExtent => throw UnimplementedError();

  @override
  bool shouldRebuild(covariant Object oldDelegate) {
    // TODO: implement shouldRebuild
    throw UnimplementedError();
  }
}