import 'package:branding/features/product/presentation/widget/cart_counter.dart';
import 'package:flutter/material.dart';

import '../widget/color_and_size.dart';
import '../widget/product_with_image.dart';

class DetailsScreen extends StatelessWidget {
  static String routePath = "/details";

  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3D82AE),
      appBar: AppBar(
        backgroundColor: Color(0xFF3D82AE),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: DetailsBody(),
    );
  }
}

class DetailsBody extends StatelessWidget {
  const DetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: size.height,
            child: Stack(children: [
              Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                      top: size.height * 0.12, left: 20, right: 20),
                  height: 500,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )),
                  child: Column(
                    children: [
                      ColorAndSize(),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          'Check out our funk t shirt selection for the very best in unique or custom, handmade pieces from our clothing shops',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CardCart(),
                          Container(
                            padding: EdgeInsets.all(1),
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                                color: Colors.red, shape: BoxShape.circle),
                            child: Icon(Icons.heart_broken),
                          )
                        ],
                      ),
                    ],
                  )),
              const ProductTileWithImage(
                image: 'assets/images/productimg/t-shirt plain.png',
                price: 400.00,
              )
            ]),
          )
        ],
      ),
    );
  }
}
