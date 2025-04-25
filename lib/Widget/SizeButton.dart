import 'package:coffeeshopapp/Constant.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Sizebutton extends StatelessWidget {
  final Function()? ontap;
  final bool iselected;
  final String name;
  const Sizebutton(
      {super.key, this.ontap, required this.iselected, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: ontap,
          child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                border: iselected ? Border.all(color: orange, width: 2) : null,
                borderRadius: BorderRadius.circular(10),
                color: darkgrey),
            child: Center(
              child: Text(name,
                  style: TextStyle(
                      fontSize: texts,
                      color: !iselected ? Color(0xffAEAEAE) : orange,
                      fontWeight: FontWeight.w700)),
            ),
          ),
        ),
        Gap(20),
      ],
    );
    ;
  }
}
