
import 'package:flutter/material.dart';

class MyProducts extends StatefulWidget {
  const MyProducts({super.key});

  @override
  MyProductsState createState() => MyProductsState();
}

class MyProductsState extends State<MyProducts> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Our Products', // 'Our Products' Text
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
              
        // PageView to show product images
        SizedBox(
          height: 200,
            child: PageView(
              children: [
                Image.asset('assets/butter.jpeg', fit: BoxFit.cover),
                Image.asset('assets/phone.jpg', fit: BoxFit.cover),
                Image.asset('assets/camera.jpg', fit: BoxFit.cover),
              ]
            ),
        ),
      ],
    );
  }
}
