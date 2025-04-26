import 'package:coffeeshopapp/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Smallbutton extends StatelessWidget {
  const Smallbutton({super.key});

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
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/Images/Cappuccino/model2.jpeg",
                  width: 126,
                  height: 126,
                  fit: BoxFit.fill,
                ),
              ),
              Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Cappuccino",
                    style: TextStyle(fontSize: 15, color: white),
                  ),
                  Text(
                    "With Steamed Milk",
                    style: TextStyle(fontSize: 10, color: Color(0xffAEAEAE)),
                  ),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                            color: black,
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "S",
                              style: TextStyle(
                                  fontSize: textl,
                                  color: white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Gap(35),
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "\$ ",
                              style: TextStyle(
                                  color: orange,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "4.20",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 35,
                          height: 29,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: SvgPicture.asset(
                            "assets/Icons/Vector-8.svg",
                            width: 8,
                            color: white,
                          ),
                        ),
                        Container(
                            width: 80,
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
                          width: 35,
                          height: 29,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: SvgPicture.asset(
                            "assets/Icons/add.svg",
                            width: 8,
                            color: white,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Gap(10),
      ],
    );
  }
}
