import 'package:coffeeshopapp/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class LargeButton extends StatelessWidget {
  const LargeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xff262B33).withOpacity(1),
                Color(0xff262B33).withOpacity(0),
              ],
              stops: [0.0, 1.0],
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      "assets/Images/Cappuccino/model1.png",
                      width: 100,
                      height: 100,
                    ),
                  ),
                  Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Cappuccino",
                        style: TextStyle(fontSize: textm, color: white),
                      ),
                      Text(
                        "With Steamed Milk",
                        style: TextStyle(
                            fontSize: textxs, color: Color(0xffAEAEAE)),
                      ),
                      Gap(10),
                      Container(
                        width: 118,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0xff141921),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Text(
                            "Medium Roasted",
                            style: TextStyle(
                                fontSize: textxs,
                                fontWeight: FontWeight.w700,
                                color: Color(0xffAEAEAE)),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 72,
                    decoration: BoxDecoration(
                        color: black, borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "S",
                          style: TextStyle(
                              fontSize: textm,
                              color: white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "\$ ",
                          style: TextStyle(
                              color: orange,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "4.20",
                          style: TextStyle(
                              color: white,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 29,
                    height: 29,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: orange, borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/Icons/Vector-8.svg",
                      width: 8,
                      color: white,
                    ),
                  ),
                  Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: black,
                          border: Border.all(width: 1, color: orange),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: white,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  Container(
                    width: 29,
                    height: 29,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: orange, borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/Icons/add.svg",
                      width: 8,
                      color: white,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 72,
                    decoration: BoxDecoration(
                        color: black, borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "L",
                          style: TextStyle(
                              fontSize: textm,
                              color: white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "\$ ",
                          style: TextStyle(
                              color: orange,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "4.20",
                          style: TextStyle(
                              color: white,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 29,
                    height: 29,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: orange, borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/Icons/Vector-8.svg",
                      width: 8,
                      color: white,
                    ),
                  ),
                  Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: black,
                          border: Border.all(width: 1, color: orange),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: white,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  Container(
                    width: 29,
                    height: 29,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: orange, borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/Icons/add.svg",
                      width: 8,
                      color: white,
                    ),
                  ),
                ],
              ),
              Gap(10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: 72,
                    decoration: BoxDecoration(
                        color: black, borderRadius: BorderRadius.circular(12)),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "M",
                          style: TextStyle(
                              fontSize: textm,
                              color: white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "\$ ",
                          style: TextStyle(
                              color: orange,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        ),
                        Text(
                          "4.20",
                          style: TextStyle(
                              color: white,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: 29,
                    height: 29,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: orange, borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/Icons/Vector-8.svg",
                      width: 8,
                      color: white,
                    ),
                  ),
                  Container(
                      width: 50,
                      height: 30,
                      decoration: BoxDecoration(
                          color: black,
                          border: Border.all(width: 1, color: orange),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "1",
                          style: TextStyle(
                              color: white,
                              fontSize: textm,
                              fontWeight: FontWeight.w700),
                        ),
                      )),
                  Container(
                    width: 29,
                    height: 29,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: orange, borderRadius: BorderRadius.circular(10)),
                    child: SvgPicture.asset(
                      "assets/Icons/add.svg",
                      width: 8,
                      color: white,
                    ),
                  ),
                ],
              ),
              Gap(10),
            ],
          ),
        ),
        Gap(10),
      ],
    );
  }
}
