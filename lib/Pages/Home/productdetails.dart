// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffeeshopapp/Controller/Cart/CartController.dart';
import 'package:coffeeshopapp/Model/Product.dart';
import 'package:coffeeshopapp/Controller/Provider/CartScreenProvider.dart';
import 'package:coffeeshopapp/Controller/Provider/Productdetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';
import 'package:coffeeshopapp/Widget/SizeButton.dart';
import 'package:provider/provider.dart';

class Productdetails extends StatelessWidget {
  final Product product;
  final List<button> size;
  const Productdetails({
    Key? key,
    required this.product,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    final productprovider = Provider.of<Productdetailsprovider>(context);

    // Future.microtask(() {
    //   Provider.of<Productdetailsprovider>(context, listen: false)
    //       .initializeCounter(widget.product.id);
    // });
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppBar(
        prefix: "assets/Icons/Back.svg",
        suffix: "assets/Icons/fav.svg",
        ismain: false,
        ontapsuffix: () {
          productprovider.checkfav(product.id, context);
        },
        opactiy: 1,
        ontap: () {
          Navigator.pop(context);
        },
        isfav: productprovider.isfav,
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
                child: FadeInImage.assetNetwork(
                  placeholder:
                      'assets/Icons/placeholder.png', // حط صورة placeholder عندك
                  image: product.imageUrl,
                  fit: BoxFit.cover,
                ),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  style: TextStyle(
                                      fontSize: textxl,
                                      color: white,
                                      fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  product.SmallCaption,
                                  style: TextStyle(
                                    fontSize: texts,
                                    color: white,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                _buildInfoCard(
                                    "assets/Icons/Bean.svg", product.category),
                                Gap(20),
                                _buildInfoCard(
                                    "assets/Icons/Drop.svg", "Europe"),
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
                                  product.rates,
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
          Expanded(
            child: Container(
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
                    product.description,
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
                        return Row(
                          children: [
                            Sizebutton(
                              iselected: item.isselected,
                              name: item.name,
                              ontap: () {
                                productprovider.selectbutton(size, item);
                              },
                            ),
                            Gap(25),
                          ],
                        );
                      }),
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
                                AnimatedSwitcher(
                                  duration: Duration(milliseconds: 300),
                                  child: Text(
                                    productprovider.price.isEmpty
                                        ? "0"
                                        : productprovider.price,
                                    key: ValueKey(productprovider.price),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: white),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Consumer<Cartscreenprovider>(
                        builder: (BuildContext context, cartprovider,
                            Widget? child) {
                          return GestureDetector(
                            onTapDown: productprovider.id != null
                                ? (_) => cartprovider.tapDown()
                                : null,
                            onTapUp: productprovider.id != null
                                ? (_) => cartprovider.tapUp()
                                : null,
                            onTapCancel: productprovider.id != null
                                ? () => cartprovider.tapCancel()
                                : null,
                            onTap: productprovider.id != null
                                ? () async {
                                    await addtocart(productprovider.id!, 1);
                                    await cartprovider.loadcartscreen();

                                    // Snackbar
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text('✔ Added to cart'),
                                        duration: Duration(seconds: 2),
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                        margin: EdgeInsets.only(
                                          bottom: 100,
                                          left: 20,
                                          right: 20,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    );
                                  }
                                : null,
                            child: AnimatedScale(
                              scale: cartprovider.scale,
                              duration: Duration(milliseconds: 150),
                              child: Container(
                                width: 240,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: productprovider.id != null
                                      ? orange
                                      : Colors.grey, // Change color
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Center(
                                  child: Text(
                                    "Add to Cart",
                                    style: TextStyle(
                                      fontSize: textm,
                                      color: white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(String assetPath, String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Color(0xff141921), borderRadius: BorderRadius.circular(14)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              assetPath,
              color: orange,
              width: 24,
            ),
            Gap(2),
            Text(
              label,
              style: TextStyle(color: grey, fontSize: textxs),
            ),
          ],
        ),
      ),
    );
  }
}
