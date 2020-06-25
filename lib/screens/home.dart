import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'cart.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true,
              backgroundColor: Colors.blue[900],
              expandedHeight: 260,
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
                                child: Image.asset('images/notfication.png'),
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
                        offset: Offset(0, 2),
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
                        height: 180,
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
                childAspectRatio: 9 / 13.2,
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
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: BorderSide(
        color: Colors.grey[300],
      ),
    );
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.grey[300]),
        borderRadius: BorderRadius.circular(30),
        // color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2,
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
          filled: true,
          fillColor: Colors.white,
          suffixIcon: SizedBox(
            width: 60,
            child: Row(
              children: [
                Text(
                  'بحث',
                  style: TextStyle(color: Colors.grey[400]),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey[300],
                ),
              ],
            ),
          ),
          border: inputBorder,
          enabledBorder: inputBorder,
          focusedBorder: inputBorder,
          // hintText: '',
          // hintStyle: TextStyle(color: Colors.grey[400]),
        ),
      ),
    );
  }
}

class ProductItem extends StatefulWidget {
  final String name;
  final double price;
  final int intialQuantity;
  final String image;

  const ProductItem({
    Key key,
    @required this.name,
    @required this.price,
    @required this.intialQuantity,
    @required this.image,
  }) : super(key: key);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();

    _quantity = widget.intialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(widget.image),
          const SizedBox(height: 15),
          Text(widget.name),
          const SizedBox(height: 5),
          Text(
            '${widget.price.toStringAsFixed(2)} ر.س',
            style: TextStyle(color: Colors.blue),
          ),
          const SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.add_circle),
                  onPressed: () {
                    setState(() {
                      _quantity += 1;
                    });
                    // Scaffold.of(context).showSnackBar(SnackBar(

                    // ));
                  },
                  color: Colors.blue[900],
                ),
                Text(_quantity.toString()),
                IconButton(
                  icon: Icon(Icons.remove_circle),
                  onPressed: () {
                    if (_quantity == 0) return;
                    setState(() {
                      _quantity -= 1;
                    });
                  },
                  color: Colors.blue[50],
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[300],
            blurRadius: 5,
            offset: Offset(-2, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
    );
  }
}
