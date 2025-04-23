import 'package:coffeeshopapp/Constant.dart';
import 'package:flutter/material.dart';

class Listwidget extends StatelessWidget {
  final String name;
  final bool isactive;

  const Listwidget({
    super.key,
    required this.name,
    required this.isactive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name,
          style: TextStyle(
            fontSize: textxl,
            fontWeight: FontWeight.w700,
            color: isactive ? orange : grey,
          ),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          width: isactive ? 10 : 0,
          height: isactive ? 10 : 0,
          margin: EdgeInsets.only(top: 6),
          decoration: BoxDecoration(
            color: orange,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}
