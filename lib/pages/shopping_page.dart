import 'package:firebase_authentication/pages/add_to_cart.dart';
import 'package:firebase_authentication/pages/hot_offers.dart';
import 'package:firebase_authentication/pages/my_products.dart';
import 'package:flutter/material.dart';

class ShoppingPage extends StatefulWidget {
  const ShoppingPage({super.key});

  @override
  ShoppingPageState createState() => ShoppingPageState();
}

class ShoppingPageState extends State<ShoppingPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping App'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MyProducts(),
              AddToCart(),
              HotOffers(),
            ],
          ),
        ),
      ),
    );
  }
}