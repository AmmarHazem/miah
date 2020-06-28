import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miah/widgets/product_item.dart';
import 'package:miah/widgets/search_field.dart';

import 'cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (cxt, constraints) {
            double aspectRatio;
            if (constraints.maxWidth < 400) {
              aspectRatio = 9 / 19;
            } else if (constraints.maxWidth >= 400) {
              aspectRatio = 9 / 16;
            }
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: Colors.blue[900],
                  expandedHeight: 250,
                  titleSpacing: 0,
                  title: Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  border: Border.all(color: Colors.grey[600]),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                  ),
                                ),
                                child: Image.asset('images/sidemeaun.png'),
                              ),
                              Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.black26,
                                      // border: Border.all(color: Colors.grey),
                                      shape: BoxShape.circle,
                                    ),
                                    child:
                                        Image.asset('images/notfication.png'),
                                  ),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text(
                              'الرئيسية',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                // padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.black26,
                                  border: Border.all(color: Colors.grey[600]),
                                  borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                ),
                                child: SizedBox(
                                  height: 35,
                                  width: 35,
                                  child: IconButton(
                                    padding: const EdgeInsets.all(0),
                                    icon: Image.asset('images/cart.png'),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        CupertinoPageRoute(
                                          builder: (cxt) => CartScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(0, 4),
                          ),
                        ],
                        color: Colors.white,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: double.infinity,
                            // height: double.infinity,
                            height: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('images/2.png'),
                                fit: BoxFit.cover,
                                alignment: Alignment.bottomCenter,
                              ),
                            ),
                            alignment: Alignment.bottomCenter,
                          ),
                          SearchField(),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  sliver: SliverGrid.extent(
                    maxCrossAxisExtent: 250,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: aspectRatio,
                    // childAspectRatio: constraints.maxWidth /
                    //     (constraints.maxWidth *
                    //         2.1),
                    children: List.generate(
                      10,
                      (index) => ProductItem(
                        image: 'images/3.png',
                        intialQuantity: 1,
                        name: 'زجاجة مياه كبيرة',
                        price: 10,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
