import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Controller/GetFavourites.dart';
import 'package:coffeeshopapp/Controller/GetProduct.dart';
import 'package:coffeeshopapp/Model/Favouritemodel.dart';
import 'package:coffeeshopapp/Model/Product.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:coffeeshopapp/Pages/Home/productdetails.dart';
import 'package:coffeeshopapp/Controller/Provider/HomeScreenProvider.dart';
import 'package:coffeeshopapp/Widget/Listnames.dart';
import 'package:coffeeshopapp/Widget/choosetype.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  // List<bool> select = [];
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Future.microtask(() {
    //   Provider.of<Homescreenprovider>(context, listen: false)
    //       .initializeCounter();
    // });
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Gap(20),
          Text(
            "Find the best\ncoffee for you",
            style: TextStyle(
                fontSize: textxxl, fontWeight: FontWeight.w700, color: white),
          ),
          Gap(20),
          Container(
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xff141921)),
            child: TextField(
              controller: _controller,
              style: TextStyle(color: grey),
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 20.0, horizontal: 20),
                hintText: "Find Your Coffee...",
                fillColor: Color(0xff141921),
                border: InputBorder.none,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: SvgPicture.asset(
                    "assets/Icons/Search.svg",
                    color: grey,
                  ),
                ),
              ),
            ),
          ),
          Gap(20),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Consumer<Homescreenprovider>(
                builder: (BuildContext context, homeprovider, Widget? child) {
                  return homeprovider.Cat.length == 0
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                              List.generate(homeprovider.Cat.length, (index) {
                            return GestureDetector(
                                onTap: () {
                                  homeprovider.selectcategory(index);
                                },
                                child: Row(
                                  children: [
                                    Listwidget(
                                      isactive: homeprovider.select[index],
                                      name: homeprovider.Cat[index],
                                    ),
                                    Gap(30),
                                  ],
                                ));
                          }),
                        );
                },
              )),
          Gap(20),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Consumer<Homescreenprovider>(
                builder: (BuildContext context, homeprovider, Widget? child) {
                  return homeprovider.filteredprocudcts.length == 0
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Row(
                          children: List.generate(
                              homeprovider.filteredprocudcts.length, (index) {
                            Product item =
                                homeprovider.filteredprocudcts[index];

                            return GestureDetector(
                              onTap: () {
                                homeprovider.pushbutton(context, item);
                                Navigator.push(context, CupertinoPageRoute(
                                    builder: (BuildContext context) {
                                  return Productdetails(
                                    product: item,
                                    size: item.productSizes
                                        .map((size) => button(
                                            name: size.sizeName,
                                            price: size.price.toString(),
                                            id: size.id))
                                        .toList(),
                                  );
                                }));
                              },
                              child: Row(
                                children: [
                                  Choosetype(
                                    item: item,
                                    israting: true,
                                  ),
                                  Gap(20)
                                ],
                              ),
                            );
                          }),
                        );
                },
              )),
          Gap(20),
          Text(
            "Coffee beans",
            style: TextStyle(
                fontSize: 16, color: white, fontWeight: FontWeight.w700),
          ),
          Gap(20),
          SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              child: Consumer<Homescreenprovider>(
                builder: (BuildContext context, homeprovider, Widget? child) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(homeprovider.beansproducts.length,
                        (index) {
                      Product item = homeprovider.beansproducts[index];
                      return Row(
                        children: [
                          GestureDetector(
                            onTap: () async {
                              List<Favouritemodel> fav = [];
                              bool isfav = false;
                              fav = await getfavourites();
                              for (int i = 0; i < fav.length; i++) {
                                if (fav[i].productId == item.id) {
                                  isfav = true;
                                }
                              }
                              Navigator.push(context, CupertinoPageRoute(
                                  builder: (BuildContext context) {
                                return Productdetails(
                                  product: item,
                                  size: item.productSizes
                                      .map((size) => button(
                                          name: size.sizeName,
                                          price: size.price.toString(),
                                          id: size.id))
                                      .toList(),
                                );
                              }));
                            },
                            child: Choosetype(
                              item: item,
                              israting: false,
                            ),
                          ),
                          Gap(20)
                        ],
                      );
                    }),
                  );
                },
              )),
          Gap(50),
        ],
      ),
    );
  }
}
