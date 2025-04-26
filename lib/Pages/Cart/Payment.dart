import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 15),
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: orange,
                  ),
                  borderRadius: BorderRadius.circular(25)),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          '''3897     8923      6745     4638''',
                          style: TextStyle(
                              fontSize: 26,
                              color: white,
                              fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Holder Name",
                                  style: TextStyle(
                                      color: Color(0xffAEAEAE), fontSize: 10),
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
                                      color: Color(0xffAEAEAE), fontSize: 10),
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
            )
          ],
        ),
      ),
    );
  }
}
