import 'dart:math';

import 'package:flutter/material.dart';

class StackSlider extends StatefulWidget {
  StackSlider({
    Key key,
  }) : super(key: key);

  @override
  _StackSliderState createState() => _StackSliderState();
}

class _StackSliderState extends State<StackSlider> {
  List<String> images = [
    "images/3.png",
    "images/3.png",
    "images/3.png",
    "images/3.png",
  ];
  PageController controller;
  double currentPage;

  @override
  void initState() {
    super.initState();

    currentPage = images.length - 1.0;
    controller = PageController(initialPage: images.length - 1);
    controller.addListener(() {
      setState(() {
        currentPage = controller.page;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            CardScrollWidget(currentPage, images),
            Positioned.fill(
              child: PageView.builder(
                itemCount: images.length,
                controller: controller,
                // reverse: true,
                itemBuilder: (context, index) {
                  return Container();
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => AnimatedContainer(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              duration: Duration(milliseconds: 150),
              decoration: BoxDecoration(
                color: currentPage == index ? Colors.blue : Colors.blue[900],
                borderRadius: BorderRadius.circular(10),
              ),
              width: currentPage == index ? 40 : 10,
              height: 10,
            ),
          ),
        ),
      ],
    );
  }
}

class CardScrollWidget extends StatelessWidget {
  final currentPage;
  final padding = 20.0;
  final verticalInset = 20.0;
  final List<String> images;

  CardScrollWidget(this.currentPage, this.images);

  @override
  Widget build(BuildContext context) {
    final cardAspectRatio = 14 / 9; // 12.0 / 16.0;
    final widgetAspectRatio = cardAspectRatio * 1.2;
    return AspectRatio(
      aspectRatio: widgetAspectRatio,
      child: LayoutBuilder(builder: (context, contraints) {
        var width = contraints.maxWidth;
        var height = contraints.maxHeight;

        var safeWidth = width - 2 * padding;
        var safeHeight = height - 2 * padding;

        var heightOfPrimaryCard = safeHeight;
        var widthOfPrimaryCard = heightOfPrimaryCard * cardAspectRatio;

        var primaryCardLeft = safeWidth - (widthOfPrimaryCard * 1.2);
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
            start: start - 60,
            end: -start + 10,
            textDirection: TextDirection.rtl,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
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
                    child: Image.asset(
                      images[i],
                      fit: BoxFit.contain,
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
