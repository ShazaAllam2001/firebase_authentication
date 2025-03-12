import 'package:flutter/material.dart';

class HotOffers extends StatefulWidget {
  const HotOffers({super.key});

  @override
  HotOffersState createState() => HotOffersState();
}

class HotOffersState extends State<HotOffers> {
  final List<String> offerImages = [
    'assets/dress.jpg',
    'assets/camera.jpg',
    'assets/phone.jpg',
    'assets/shirt.jfif',
    'assets/pants.jfif',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            'Hot Offers', // 'Our Products' Text
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height / 5, // use of Media Query
          child: ListView.builder( // offers ListView
            scrollDirection: Axis.horizontal,
            itemCount: offerImages.length,
            itemBuilder: (context, index) {
              return Container(
                width: 200,
                height: 150,
                margin: EdgeInsets.all(10.0),
                child: Card(
                  elevation: 4,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Image.asset(offerImages[index], fit: BoxFit.cover),
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: EdgeInsets.all(5.0),
                          child: Text(
                            'Offer ${index + 1}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}