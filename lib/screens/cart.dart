import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final listItems = List.generate(
      10,
      (index) => CartItem(
        image: 'images/3.png',
        initialQuantity: 1,
        name: 'زجاجة مياه كبيرة',
        price: 10,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'سلة التسوق',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: FlatButton(
                      padding: const EdgeInsets.all(0),
                      shape: CircleBorder(),
                      child: Image.asset('images/ic_back.png'),
                      onPressed: () => Navigator.pop(context),
                      color: Colors.black38,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: ListView.separated(
                      itemBuilder: (cxt, index) => listItems[index],
                      separatorBuilder: (cxt, index) =>
                          const SizedBox(height: 20),
                      itemCount: listItems.length,
                      padding: const EdgeInsets.symmetric(
                        vertical: 30,
                        horizontal: 20,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 40,
                    right: 40,
                    bottom: 20,
                    child: FlatButton(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text('أتمام عملية الدفع'),
                      onPressed: () {},
                      color: Colors.blue[900],
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CartItem extends StatefulWidget {
  final String name;
  final String image;
  final double price;
  final int initialQuantity;

  const CartItem({
    Key key,
    @required this.name,
    @required this.price,
    @required this.initialQuantity,
    @required this.image,
  }) : super(key: key);

  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _quantity = 0;

  @override
  void initState() {
    super.initState();

    _quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[300],
                blurRadius: 4,
              ),
            ],
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 20,
          ),
          child: Row(
            children: [
              Expanded(child: Image.asset(widget.image)),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.name),
                    Text('${widget.price.toStringAsFixed(2)} ر.س'),
                    Container(
                      width: 150,
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
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            width: 25,
            height: 25,
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(10)),
              ),
              padding: const EdgeInsets.all(0),
              child: Icon(
                Icons.close,
                size: 15,
              ),
              onPressed: () {},
              color: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }
}
