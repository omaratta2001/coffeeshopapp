// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffeeshopapp/Widget/SizeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';

class button {
  final String name;
  bool isselected;
  button({required this.name, this.isselected = false});
}

class Productdetails extends StatefulWidget {
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  List<button> size = [
    button(name: "250gm"),
    button(name: "500gm"),
    button(name: "1000gm"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        prefix: "assets/Icons/Back.svg",
        suffix: "assets/Icons/fav.svg",
        ismain: false,
        opactiy: 1,
        ontap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.7,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/Images/image1.png"),
                        fit: BoxFit.fill)),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 170,
                  decoration: BoxDecoration(
                    color: black.withOpacity(0.5),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(27),
                      topRight: Radius.circular(27),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Robusta Beans",
                                  style: TextStyle(
                                      fontSize: textxl,
                                      color: white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  "From Africa",
                                  style: TextStyle(
                                    fontSize: texts,
                                    color: white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: 56,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Color(0xff141921),
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/Icons/Beans.svg",
                                          color: orange,
                                        ),
                                        Text(
                                          "Coffe",
                                          style: TextStyle(
                                              color: grey, fontSize: textxs),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Gap(20),
                                Container(
                                  width: 56,
                                  height: 60,
                                  decoration: BoxDecoration(
                                      color: Color(0xff141921),
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(
                                          "assets/Icons/Drop.svg",
                                          width: 25,
                                          color: orange,
                                        ),
                                        Gap(2),
                                        Text(
                                          "Milk",
                                          style: TextStyle(
                                              color: grey, fontSize: textxs),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/Icons/star.svg",
                                  color: orange,
                                  width: 23,
                                ),
                                Gap(5),
                                Text(
                                  "4.5",
                                  style: TextStyle(
                                      fontSize: textxl,
                                      color: white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Gap(5),
                                Text(
                                  "(6,879)",
                                  style: TextStyle(
                                      color: Color(0xffAEAEAE),
                                      fontSize: textxs,
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            Container(
                              width: 132,
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
                  ),
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.5,
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(
                      fontSize: textl,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffAEAEAE)),
                ),
                Text(
                  "Arabica beans are by far the most popular type of coffee beans, making up about 60% of the world’s coffee. These tasty beans originated many centuries ago in the highlands of Ethiopia, and may even be the first coffee beans ever consumed! ",
                  style: TextStyle(fontSize: textl, color: white),
                ),
                Text(
                  "Size",
                  style: TextStyle(
                      fontSize: textl,
                      fontWeight: FontWeight.w700,
                      color: Color(0xffAEAEAE)),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(size.length, (index) {
                      final button item = size[index];
                      return Sizebutton(
                          iselected: item.isselected,
                          name: item.name,
                          ontap: () {
                            setState(() {
                              for (var s in size) {
                                s.isselected = false;
                              }
                              item.isselected = true;
                            });
                          });
                    }),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontSize: texts,
                              color: Color(0xffAEAEAE),
                              fontWeight: FontWeight.w700),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
