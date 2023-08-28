import 'package:flutter/material.dart';

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
                height: 500,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    )),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Calm Warm Experience',
                      style: TextStyle(color: Colors.white),
                    ),
                    Text(
                      'Cotton T-shirt',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        RichText(
                            text: TextSpan(
                          children: [
                            TextSpan(text: 'Price\n'),
                            TextSpan(
                                text: '400.00', style: TextStyle(fontSize: 30))
                          ],
                        )),
                        SizedBox(width: 20),
                        Expanded(
                            child: Image.asset(
                          'assets/images/productimg/t-shirt plain.png',
                          fit: BoxFit.fill,
                        ))
                      ],
                    )
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}
