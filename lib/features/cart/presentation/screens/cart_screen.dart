import 'package:branding/features/payment/presentation/screens/payments_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatelessWidget {
  static String routePath = '/cart';
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      bottomNavigationBar: Material(
        elevation: 2,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
                child: Text("Total : \$975",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    ))),
            Expanded(
                child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 2),
              ),
              onPressed: () {
                context.push(PaymentsScreen.routePath);
              },
              child: Text(
                "Pay",
                style: TextStyle(fontSize: 18.0),
              ),
            )),
          ],
        ),
      ),
      body: Center(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Theme.of(context).primaryColor),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/images/hoody.png'),
                      height: 110.0,
                      width: 110.0,
                      fit: BoxFit.cover,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('title',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(fontSize: 16)),
                            const Text(
                                // cartItems[index].
                                'description',
                                style: TextStyle(
                                  fontSize: 12.0,
                                )),
                            Text("\$ 3000".toString()),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   if (cartItems[index].quantity > 0) {
                                      //     cartItems[index].quantity--;
                                      //   }
                                      // });
                                    },
                                    icon: Icon(
                                      Icons.remove_circle_outline,
                                      color: Theme.of(context).primaryColor,
                                    )),
                                Container(
                                    width: 33.0,
                                    height: 33.0,
                                    padding: EdgeInsets.only(top: 10.0),
                                    color: Color(0xFFF1F1F1),
                                    child: const TextField(
                                      enabled: false,
                                      textAlign: TextAlign.center,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '0',
                                          // hintText: cartItems[index]
                                          //     .quantity
                                          //     .toString(),
                                          hintStyle: TextStyle(
                                              color: Color(0xFF303030))),
                                    )),
                                IconButton(
                                    onPressed: () {
                                      // setState(() {
                                      //   // Max 5
                                      //   if (cartItems[index].quantity <= 4) {
                                      //     cartItems[index].quantity++;
                                      //   }
                                      // });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      color: Theme.of(context).primaryColor,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
