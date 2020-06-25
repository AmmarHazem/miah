import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miah/screens/home.dart';

List<String> images = [
  "images/3.png",
  "images/3.png",
  "images/3.png",
  "images/3.png",
  "images/3.png",
  "images/3.png",
  "images/3.png",
  "images/3.png",
];

var cardAspectRatio = 16 / 9;
var widgetAspectRatio = cardAspectRatio * 1.2;

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  var currentPage = images.length - 1.0;

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) {
            final listItems = <Widget>[
              Stack(
                children: <Widget>[
                  CardScrollWidget(currentPage),
                  Positioned.fill(
                    child: PageView.builder(
                      itemCount: images.length,
                      controller: controller,
                      reverse: true,
                      itemBuilder: (context, index) {
                        return Container();
                      },
                    ),
                  )
                ],
              ),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                direction: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => CategoryItem(
                    image: 'images/3.png',
                    name: 'أسم القسم',
                    onTap: () => Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (cxt) => HomeScreen(),
                      ),
                    ),
                    width: constraints.maxWidth * 0.43,
                  ),
                ),
              ),
            ];
            return ListView.builder(
              itemBuilder: (cxt, index) => listItems[index],
              itemCount: listItems.length,
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
            );
          },
        ),
      ),
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  var currentPage;
  var padding = 20.0;
  var verticalInset = 20.0;

  CardScrollWidget(this.currentPage);

  @override
  Widget build(BuildContext context) {
    // final cardAspectRatio = 12.0 / 16.0;
    // final widgetAspectRatio = cardAspectRatio * 1.2;
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - widthOfPrimaryCard;
        var horizontalInset = primaryCardLeft / 2;

        List<Widget> cardList = new List();

        for (var i = 0; i < images.length; i++) {
          var delta = i - currentPage;
          bool isOnRight = delta > 0;

          var start = padding +
              max(
                primaryCardLeft -
                    horizontalInset * -delta * (isOnRight ? 15 : 1),
                0.0,
              );

          var cardItem = Positioned.directional(
            top: padding + verticalInset * max(-delta, 0.0),
            bottom: padding + verticalInset * max(-delta, 0.0),
            start: start,
            textDirection: TextDirection.rtl,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 4,
                    color: Colors.black38,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: Container(
                  decoration: BoxDecoration(color: Colors.white, boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: Offset(3.0, 6.0),
                      blurRadius: 10.0,
                    )
                  ]),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Image.asset(images[i], fit: BoxFit.contain),

                        // Align(
                        //   alignment: Alignment.bottomLeft,
                        //   child: Column(
                        //     mainAxisSize: MainAxisSize.min,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Padding(
                        //         padding: EdgeInsets.symmetric(
                        //           horizontal: 16.0,
                        //           vertical: 8.0,
                        //         ),
                        //         child: Text(
                        //           title[i],
                        //           style: TextStyle(
                        //             color: Colors.white,
                        //             fontSize: 25.0,
                        //             fontFamily: "SF-Pro-Text-Regular",
                        //           ),
                        //         ),
                        //       ),
                        //       SizedBox(
                        //         height: 10.0,
                        //       ),
                        //       Padding(
                        //         padding: const EdgeInsets.only(
                        //           left: 12.0,
                        //           bottom: 12.0,
                        //         ),
                        //         child: Container(
                        //           padding: EdgeInsets.symmetric(
                        //             horizontal: 22.0,
                        //             vertical: 6.0,
                        //           ),
                        //           decoration: BoxDecoration(
                        //             color: Colors.blueAccent,
                        //             borderRadius: BorderRadius.circular(20.0),
                        //           ),
                        //           child: Text(
                        //             "Read Later",
                        //             style: TextStyle(color: Colors.white),
                        //           ),
                        //         ),
                        //       )
                        //     ],
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
          cardList.add(cardItem);
        }
        return Stack(
          children: cardList,
        );
      }),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String image;
  final String name;
  final Function onTap;
  final double width;

  const CategoryItem({
    Key key,
    @required this.image,
    @required this.name,
    @required this.onTap,
    @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        children: [
          Container(
            height: width * 1.2,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Colors.grey[300],
                ),
              ],
            ),
            child: Image.asset(image),
          ),
          Positioned(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      blurRadius: 10, spreadRadius: 0, color: Colors.black38),
                ],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/ic_back-1.png'),
                  Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
            bottom: 10,
            left: 40,
            right: 40,
          ),
        ],
      ),
    );
  }
}
