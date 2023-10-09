

import 'package:flutter/material.dart';

class ProductTileWithImage extends StatelessWidget {
  final String image;
  final double price;

  const ProductTileWithImage({
    required this.image,
    required this.price,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Calm Warm Experience',
            style: TextStyle(color: Colors.white),
          ),
          const Text(
            'Cotton T-shirt',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 60),
          Row(
            children: [
              RichText(
                  text: TextSpan(
                children: [
                  const TextSpan(text: 'Price\n'),
                  TextSpan(
                      text: price.toString(), style:const TextStyle(fontSize: 30))
                ],
              )),
              // SizedBox(width: 20),
              Expanded(
                  child: Image.asset(
                image,
                fit: BoxFit.fill,
              ))
            ],
          )
        ],
      ),
    );
  }
}
