import 'package:flutter/material.dart';

class CardCart extends StatefulWidget {
  const CardCart({super.key});

  @override
  State<CardCart> createState() => _CardCartState();
}

class _CardCartState extends State<CardCart> {
  int numberOfItems = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
              onPressed: () {
                if (numberOfItems > 1) {
                  setState(() {
                    numberOfItems--;
                  });
                }
              },
              child: const Icon(
                Icons.remove,
                color: Color(0xFF3D82AE),
              )),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            numberOfItems.toString(),
            style: const TextStyle(fontSize: 18),
          ),
        ),
        SizedBox(
          width: 40,
          height: 32,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13))),
              onPressed: () {
                setState(() {
                  numberOfItems++;
                });
              },
              child: const Icon(
                Icons.add,
                color: Color(0xFF3D82AE),
              )),
        ),
      ],
    );
  }
}
