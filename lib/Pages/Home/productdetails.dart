// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';
import 'package:coffeeshopapp/Widget/SizeButton.dart';

class Productdetails extends StatefulWidget {
  final ProductModel product;
  final List<button> size;
  const Productdetails({
    Key? key,
    required this.product,
    required this.size,
  }) : super(key: key);
  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
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
        Title: '',
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
                        image: NetworkImage(widget.product.largeimage),
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
                                  widget.product.name,
                                  style: TextStyle(
                                      fontSize: textxl,
                                      color: white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  widget.product.namesmall,
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
                                          widget.product.iconbeantype,
                                          color: orange,
                                        ),
                                        Text(
                                          widget.product.type,
                                          style: TextStyle(
                                              color: grey, fontSize: textxs),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Gap(20),
                                Container(
                                  // width: 56,
                                  // height: 63,
                                  padding: EdgeInsets.symmetric(horizontal: 10),
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
                                          widget.product.iconlocationtype,
                                          width: 24,
                                          color: orange,
                                        ),
                                        Gap(2),
                                        Text(
                                          widget.product.location,
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
                                  widget.product.rate,
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
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  widget.product.Description,
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
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(widget.size.length, (index) {
                        final button item = widget.size[index];
                        return Sizebutton(
                            iselected: item.isselected,
                            name: item.name,
                            ontap: () {
                              setState(() {
                                for (var s in widget.size) {
                                  s.isselected = false;
                                }
                                item.isselected = true;
                              });
                            });
                      }),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 70,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Price",
                              style: TextStyle(
                                fontSize: texts,
                                color: Color(0xffAEAEAE),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Gap(6),
                              Text(
                                "\$",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: orange),
                              ),
                              Gap(3),
                              Text(
                                widget.product.price,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: white),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 240,
                        height: 60,
                        decoration: BoxDecoration(
                            color: orange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                fontSize: textm,
                                color: white,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
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
