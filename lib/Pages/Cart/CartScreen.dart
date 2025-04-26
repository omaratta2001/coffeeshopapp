import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Pages/Cart/Payment.dart';
import 'package:coffeeshopapp/Widget/Cart/Largebutton.dart';
import 'package:coffeeshopapp/Widget/Cart/Smallbutton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(physics: BouncingScrollPhysics(), children: [
            LargeButton(),
            Smallbutton(),
            LargeButton(),
            LargeButton(),
            Smallbutton(),
          ]),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: texts,
                            color: Color(
                              0xffAEAEAE,
                            ),
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: orange,
                                fontSize: 20),
                          ),
                          Text(
                            "10.40",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: white,
                                fontSize: 20),
                          )
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return PaymentScreen();
                      }));
                    },
                    child: Container(
                      width: 240,
                      height: 60,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Pay",
                          style: TextStyle(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
