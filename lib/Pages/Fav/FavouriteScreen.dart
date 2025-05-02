import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Controller/GetFavourites.dart';
import 'package:coffeeshopapp/Model/Favouritemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Favouritescreen extends StatefulWidget {
  const Favouritescreen({super.key});

  @override
  State<Favouritescreen> createState() => _FavouritescreenState();
}

class _FavouritescreenState extends State<Favouritescreen> {
  List<Favouritemodel> fav = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getfav();
  }

  Future<void> getfav() async {
    fav = await getfavourites();
    print(fav.length);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: fav.length == 0
          ? Center(
              child: Text(
                "No products in Favourite",
                style: TextStyle(color: white, fontSize: textxl),
              ),
            )
          : ListView(
              physics: BouncingScrollPhysics(),
              children: List.generate(fav.length, (index) {
                final Favouritemodel item = fav[index];
                return Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 457,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            NetworkImage(item.productImageUrl),
                                        fit: BoxFit.fill)),
                              ),
                              Positioned(
                                right: 20,
                                top: 20,
                                child: GestureDetector(
                                  onTap: () async {
                                    await removeFromFavourites(item.productId);
                                    fav.removeAt(index);
                                    setState(() {});
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Color(0xff21262e)),
                                        gradient: LinearGradient(colors: [
                                          Color(0xff21262E),
                                          Color(0xff0c0f14)
                                        ]),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: SvgPicture.asset(
                                      "assets/Icons/fav.svg",
                                      color: red,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.03,
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
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  item.productName,
                                                  style: TextStyle(
                                                      fontSize: textxl,
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Text(
                                                  "with Steamed Milk",
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          "assets/Icons/Bean.svg",
                                                          color: orange,
                                                        ),
                                                        Text(
                                                          "Coffee",
                                                          style: TextStyle(
                                                              color: grey,
                                                              fontSize: textxs),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Gap(20),
                                                Container(
                                                  // width: 56,
                                                  // height: 63,
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10),
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff141921),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              14)),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SvgPicture.asset(
                                                          "assets/Icons/location.svg",
                                                          width: 24,
                                                          color: orange,
                                                        ),
                                                        Gap(2),
                                                        Text(
                                                          "Africa",
                                                          style: TextStyle(
                                                              color: grey,
                                                              fontSize: textxs),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
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
                                                  item.productRate.toString(),
                                                  style: TextStyle(
                                                      fontSize: textxl,
                                                      color: white,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                Gap(5),
                                                Text(
                                                  "(6,879)",
                                                  style: TextStyle(
                                                      color: Color(0xffAEAEAE),
                                                      fontSize: textxs,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                )
                                              ],
                                            ),
                                            Container(
                                              width: 132,
                                              height: 45,
                                              decoration: BoxDecoration(
                                                color: Color(0xff141921),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Medium Roasted",
                                                  style: TextStyle(
                                                      fontSize: textxs,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                            padding: EdgeInsets.only(
                                top: 15, right: 15, bottom: 15, left: 25),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    bottomRight: Radius.circular(25)),
                                gradient: LinearGradient(colors: [
                                  Color(0xff262B33).withOpacity(1),
                                  Color(0xff262B33).withOpacity(0)
                                ])),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: textm,
                                      color: Color(0xffaeaeae),
                                      fontWeight: FontWeight.w700),
                                ),
                                Gap(5),
                                Text(
                                  item.productDescription,
                                  style: TextStyle(
                                      fontSize: textm,
                                      color: Color(0xffaeaeae),
                                      fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Gap(15),
                  ],
                );
              })),
    );
  }
}
