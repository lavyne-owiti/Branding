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
      backgroundColor:const Color(0xFF3D82AE),
      appBar: AppBar(
        backgroundColor:const Color(0xFF3D82AE),
        iconTheme: const IconThemeData(color: Colors.white),
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
         const SizedBox(width: 10),
        ],
      ),
      body:const DetailsBody(),
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
                      const ColorAndSize(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        child: Text(
                          'Check out our funk t shirt selection for the very best in unique or custom, handmade pieces from our clothing shops',
                          style: TextStyle(height: 1.5),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CardCart(),
                            Container(
                              padding: const EdgeInsets.all(8),
                              height: 32,
                              width: 32,
                              decoration: const BoxDecoration(
                                  color: Colors.red, shape: BoxShape.circle),
                              child: Image.asset(
                                'assets/images/productimg/heart.png',
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          children: [
                            Container(
                              margin:const EdgeInsets.only(right: 20),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18),
                                  border: Border.all(
                                    color:const Color(0xFF3D82AE),
                                  )),
                              child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Color(0xFF3D82AE),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 50,
                                child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                               const Color(0xFF3D82AE)),
                                        shape: MaterialStateProperty.all<
                                                OutlinedBorder>(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        18)))),
                                    onPressed: () {},
                                    child: Text(
                                      'Buy Now'.toUpperCase(),
                                      style:const TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    )),
                              ),
                            )
                          ],
                        ),
                      )
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
