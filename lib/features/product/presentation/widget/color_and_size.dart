import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Color'),
            Row(children: [
              DotColor(color: Colors.white, isSelected: true),
              DotColor(color: Color(0xFFA29B9B)),
              DotColor(color: Color(0xFF356C95)),
            ]),
          ]),
        ),
        Expanded(
          child: RichText(
              text: const TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                TextSpan(text: 'Size\n'),
                TextSpan(
                    text: 'Medium',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
              ])),
        )
      ],
    );
  }
}

class DotColor extends StatelessWidget {
  final Color color;
  final bool isSelected;
  const DotColor({
    required this.color,
    this.isSelected = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:const EdgeInsets.all(2.5),
      margin:const EdgeInsets.only(
        top: 5,
        right: 10,
      ),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: isSelected ? color : Colors.transparent),
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      ),
    );
  }
}
