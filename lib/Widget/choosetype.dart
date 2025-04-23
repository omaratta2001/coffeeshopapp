import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Choosetype extends StatelessWidget {
  final ProductModel item;
  final bool israting;
  const Choosetype({super.key, required this.item, required this.israting});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 149,
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
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(item.image)),
                israting
                    ? Positioned(
                        right: 0,
                        child: Container(
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: black.withOpacity(0.6),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20)),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset(
                                "assets/Icons/star.svg",
                                color: orange,
                                width: 10,
                              ),
                              Gap(5),
                              Text(
                                item.rate,
                                style: TextStyle(
                                    fontSize: texts,
                                    color: white,
                                    fontWeight: FontWeight.w700),
                              )
                            ],
                          ),
                        ),
                      )
                    : Container()
              ],
            ),
            Gap(10),
            Text(
              item.name,
              style: TextStyle(fontSize: textl, color: white),
            ),
            Gap(3),
            Text(
              item.namesmall,
              style: TextStyle(fontSize: 9, color: white),
            ),
            Gap(13),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: orange),
                    ),
                    Gap(3),
                    Text(
                      item.price,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  width: 29,
                  height: 29,
                  decoration: BoxDecoration(
                      color: orange, borderRadius: BorderRadius.circular(10)),
                  child: SvgPicture.asset("assets/Icons/add.svg"),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
