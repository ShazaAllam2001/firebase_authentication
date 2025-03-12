import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  AddToCartState createState() => AddToCartState();
}

class AddToCartState extends State<AddToCart> {
  final List<String> productImages = [
    'assets/dress.jpg',
    'assets/camera.jpg',
    'assets/phone.jpg',
    'assets/shirt.jfif',
    'assets/pants.jfif',
  ];

  void _showSnackbar(String message, BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productImages.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  productImages[index], 
                  height: MediaQuery.of(context).size.height / 7, // use of Media Query
                  fit: BoxFit.cover
                ),
                          
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    'Product ${index + 1}', 
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
                          
                Expanded(
                  flex: 2,
                  child: ElevatedButton(
                    onPressed: () {
                      _showSnackbar('Item added to the cart', context);
                    },   
                    child:  
                      Icon(
                        Icons.add_shopping_cart,
                        size: 16,
                      ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}