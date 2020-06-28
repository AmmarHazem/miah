import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miah/screens/home.dart';
import 'package:miah/widgets/category_item.dart';
import 'package:miah/widgets/stack_slider.dart';

// var cardAspectRatio = 16 / 9;
// var widgetAspectRatio = cardAspectRatio * 1.2;

class ProductsScreen extends StatefulWidget {
  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) {
            final listItems = <Widget>[
              StackSlider(),
              const SizedBox(height: 15),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                direction: Axis.horizontal,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
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
                    width: constraints.maxWidth * 0.4,
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
