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
        elevation: 0.2,
        leading: Image.asset("assets/images/logo.png"),
        title: Text(
          'Cart',
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              context.push(CartScreen.routePath);
            },
            icon: const Icon(Icons.shopping_cart_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Text('My Shooping Basket', style: TextStyle(fontSize: 15)),
          ),
          Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    margin:
                        const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Theme.of(context).primaryColor),
                        borderRadius:const BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        const Image(
                          image: AssetImage('assets/images/hoody.png'),
                          height: 90.0,
                          width: 90.0,
                          fit: BoxFit.cover,
                        ),
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                                        padding:const EdgeInsets.only(top: 10.0),
                                        color:const Color(0xFFF1F1F1),
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
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("Total : \$975",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                    )),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding:const EdgeInsets.symmetric(vertical: 2),
                  ),
                  onPressed: () {
                    context.push(PaymentsScreen.routePath);
                  },
                  child: const Text(
                    "Pay",
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
