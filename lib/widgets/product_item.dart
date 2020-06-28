import 'package:flutter/material.dart';

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
    return Column(
      children: <Widget>[
        Container(
          constraints: BoxConstraints(maxHeight: 270),
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
                    SizedBox(
                      width: 35,
                      child: IconButton(
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
                    ),
                    Text(_quantity.toString()),
                    SizedBox(
                      width: 35,
                      child: IconButton(
                        icon: Icon(Icons.remove_circle),
                        onPressed: () {
                          if (_quantity == 0) return;
                          setState(() {
                            _quantity -= 1;
                          });
                        },
                        color: Colors.blue[50],
                      ),
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
        ),
      ],
    );
  }
}
