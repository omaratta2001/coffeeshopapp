import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Controller/Provider/CartScreenProvider.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectpayment = 0;
  String name = "";
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        prefix: 'assets/Icons/Back.svg',
        suffix: '',
        ismain: false,
        opactiy: 0,
        Title: 'Payment',
        havesuffix: false,
        ontap: () {
          Navigator.pop(context);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectpayment = 0;
                      name = "Credit Card";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 15, right: 15, left: 15, bottom: 15),
                    decoration: selectpayment == 0
                        ? BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: orange,
                            ),
                            borderRadius: BorderRadius.circular(25))
                        : null,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Credit Card",
                          style: TextStyle(
                              fontSize: textm,
                              fontWeight: FontWeight.w700,
                              color: white),
                        ),
                        Gap(10),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 186,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                                colors: [Color(0xff262b33), Color(0xff0c0f14)],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                stops: [0, 1]),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SvgPicture.asset(
                                    "assets/Icons/card.svg",
                                    color: orange,
                                    width: 31,
                                    height: 24,
                                  ),
                                  SvgPicture.asset(
                                    "assets/Icons/Visa.svg",
                                    color: white,
                                    width: 31,
                                    height: 24,
                                  ),
                                ],
                              ),
                              Text(
                                '''3897   8923    6745   4638''',
                                style: TextStyle(
                                    fontSize: 26,
                                    color: white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Card Holder Name",
                                        style: TextStyle(
                                            color: Color(0xffAEAEAE),
                                            fontSize: 10),
                                      ),
                                      Gap(5),
                                      Text(
                                        "Omar Mohamed",
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "Expiry Date",
                                        style: TextStyle(
                                            color: Color(0xffAEAEAE),
                                            fontSize: 10),
                                      ),
                                      Gap(5),
                                      Text(
                                        "02/30",
                                        style: TextStyle(
                                            color: white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Gap(15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectpayment = 1;
                      name = "Wallet";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: selectpayment == 1
                          ? Border.all(width: 2, color: orange)
                          : null,
                      gradient: LinearGradient(
                          colors: [Color(0xff262b33), Color(0xff0c0f14)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 1]),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                "assets/Icons/wallet.svg",
                                color: orange,
                                width: 25,
                                height: 20,
                              ),
                              Gap(10),
                              Text(
                                "Wallet",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: white),
                              )
                            ],
                          ),
                          Text(
                            "\$ 100.50",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: white),
                          )
                        ]),
                  ),
                ),
                Gap(15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectpayment = 2;
                      name = "Google Pay";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: selectpayment == 2
                          ? Border.all(width: 2, color: orange)
                          : null,
                      gradient: LinearGradient(
                          colors: [Color(0xff262b33), Color(0xff0c0f14)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 1]),
                    ),
                    child: Row(children: [
                      Image.asset(
                        "assets/Icons/googlepay.png",
                        width: 25,
                        height: 20,
                      ),
                      Gap(10),
                      Text(
                        "Google Pay",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                    ]),
                  ),
                ),
                Gap(15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectpayment = 3;
                      name = "Apple Pay";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: selectpayment == 3
                          ? Border.all(width: 2, color: orange)
                          : null,
                      gradient: LinearGradient(
                          colors: [Color(0xff262b33), Color(0xff0c0f14)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 1]),
                    ),
                    child: Row(children: [
                      Image.asset(
                        "assets/Icons/applepay.png",
                        width: 25,
                        height: 20,
                      ),
                      Gap(10),
                      Text(
                        "Apple Pay",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                    ]),
                  ),
                ),
                Gap(15),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectpayment = 4;
                      name = "Amazon Pay";
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: selectpayment == 4
                          ? Border.all(width: 2, color: orange)
                          : null,
                      gradient: LinearGradient(
                          colors: [Color(0xff262b33), Color(0xff0c0f14)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0, 1]),
                    ),
                    child: Row(children: [
                      Image.asset(
                        "assets/Icons/amazonpay.png",
                        width: 25,
                        height: 20,
                      ),
                      Gap(10),
                      Text(
                        "Amazon Pay",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: white),
                      ),
                    ]),
                  ),
                )
              ],
            ),
            Positioned(
              bottom: 15,
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
                              Consumer<Cartscreenprovider>(
                                builder: (BuildContext context, cartprovider,
                                    Widget? child) {
                                  return Text(
                                    cartprovider.tot.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: white,
                                        fontSize: 20),
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, CupertinoPageRoute(
                              builder: (BuildContext context) {
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
                              "Pay from ${name}",
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
        ),
      ),
    );
  }
}
