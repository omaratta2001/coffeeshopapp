// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:coffeeshopapp/Controller/Cart/CartController.dart';
import 'package:coffeeshopapp/Model/Cartmodel.dart';
import 'package:coffeeshopapp/Controller/Provider/CartScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

import 'package:coffeeshopapp/Constant.dart';

class Smallbutton1 extends StatelessWidget {
  final int widgetindex;
  final int productid;

  const Smallbutton1(
      {Key? key, required this.widgetindex, required this.productid})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartprovider = Provider.of<Cartscreenprovider>(context);
    final Cartmodel item = cartprovider.grouped[productid]!.first;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xff262B33).withOpacity(1),
                const Color(0xff262B33).withOpacity(0),
              ],
              stops: const [0.0, 1.0],
            ),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  item.productImageUrl,
                  width: 126,
                  height: 126,
                  fit: BoxFit.fill,
                ),
              ),
              const Gap(20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productname,
                    style: const TextStyle(fontSize: 15, color: white),
                  ),
                  Text(
                    item.productsmallcaption,
                    style:
                        const TextStyle(fontSize: 10, color: Color(0xffAEAEAE)),
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Container(
                        width: 100,
                        decoration: BoxDecoration(
                          color: black,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              item.productSizename,
                              style: const TextStyle(
                                fontSize: textl,
                                color: white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Gap(15),
                      Row(
                        children: [
                          const Text(
                            "\$ ",
                            style: TextStyle(
                              color: orange,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            item.price.toStringAsFixed(2),
                            style: const TextStyle(
                              color: white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            int groupindex =
                                cartprovider.grouped[productid]!.indexOf(item);

                            cartprovider.dectot(
                                productid, groupindex, widgetindex);
                          },
                          child: Container(
                            width: 35,
                            height: 29,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              "assets/Icons/Vector-8.svg",
                              width: 8,
                              color: white,
                            ),
                          ),
                        ),
                        Container(
                          width: 80,
                          height: 30,
                          decoration: BoxDecoration(
                            color: black,
                            border: Border.all(width: 1, color: orange),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Center(
                            child: Text(
                              item.qty.toString(),
                              style: const TextStyle(
                                color: white,
                                fontSize: textm,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            int groupindex =
                                cartprovider.grouped[productid]!.indexOf(item);

                            cartprovider.increaselarge(
                                groupindex, productid, widgetindex);

                            //  cartprovider.increasetot(index1);
                          },
                          child: Container(
                            width: 35,
                            height: 29,
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: orange,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: SvgPicture.asset(
                              "assets/Icons/add.svg",
                              width: 8,
                              color: white,
                            ),
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
        const Gap(10),
      ],
    );
  }
}
