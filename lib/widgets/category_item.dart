import 'package:flutter/material.dart';

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
    return LayoutBuilder(
      builder: (cxt, constraints) {
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
                      color: Colors.grey[400],
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
                          blurRadius: 10,
                          spreadRadius: 0,
                          color: Colors.black38),
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
                left: constraints.maxWidth * 0.05,
                right: constraints.maxWidth * 0.05,
              ),
            ],
          ),
        );
      },
    );
  }
}
