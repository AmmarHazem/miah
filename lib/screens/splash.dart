import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miah/screens/products.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        CupertinoPageRoute(builder: (cxt) => ProductsScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (cxt, constraints) => Center(
          child: Image.asset(
            'images/1.png',
            width: constraints.maxWidth * 0.5,
          ),
        ),
      ),
    );
  }
}
