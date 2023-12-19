import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CartItemsWidget extends StatefulWidget {
  const CartItemsWidget({super.key});

  @override
  State<CartItemsWidget> createState() => _CartItemsWidgetState();
}

class _CartItemsWidgetState extends State<CartItemsWidget> {
  int value = 0;

  void increment() {
    setState(() {
      value++;
    });
  }

  void decrement() {
    setState(() {
      if (value > 0) {
        value--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 7,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).primaryColor),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  const Image(
                    image: AssetImage('assets/images/hoody.png'),
                    height: 80.0,
                    width: 80.0,
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
                                    decrement();
                                  },
                                  icon: Icon(
                                    Icons.remove_circle_outline,
                                    color: Theme.of(context).primaryColor,
                                  )),
                              SizedBox(
                                width: 50,
                                child: TextField(
                                  enabled: false,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: value.toString(),
                                    hintStyle:
                                        TextStyle(color: Color(0xFF303030)),
                                  ),
                                ),
                              ),
                              // const SizedBox(
                              //   width: 50,
                              //   child: TextField(
                              //     enabled: false,
                              //     textAlign: TextAlign.center,
                              //     decoration: InputDecoration(
                              //         border: InputBorder.none,
                              //         hintText: '0',
                              //         // hintText: cartItems[index]
                              //         //     .quantity
                              //         //     .toString(),
                              //         hintStyle:
                              //             TextStyle(color: Color(0xFF303030))),
                              //   ),
                              // ),
                              IconButton(
                                  onPressed: () {
                                    // setState(() {
                                    //   // Max 5
                                    //   if (cartItems[index].quantity <= 4) {
                                    //     cartItems[index].quantity++;
                                    //   }
                                    // });
                                    increment();
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
    );
  }
}
