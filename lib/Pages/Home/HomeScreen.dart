import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';
import 'package:coffeeshopapp/Widget/Listnames.dart';
import 'package:coffeeshopapp/Widget/choosetype.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> select = List.generate(5, (x) => x == false);
  List<ProductModel> product = [
    ProductModel(
        image: "assets/Images/Cappuccino/model1.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: "4.5"),
    ProductModel(
        image: "assets/Images/Cappuccino/model2.png",
        name: "Cappuccino",
        namesmall: "With Foam",
        price: "4.20",
        rate: "4.2"),
    ProductModel(
        image: "assets/Images/Cappuccino/model3.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: "4.5"),
  ];
  List<ProductModel> productbean = [
    ProductModel(
        image: "assets/Images/Beans/model1.png",
        name: "Robusta Beans",
        namesmall: "Medium Roasted",
        price: "4.20",
        rate: ""),
    ProductModel(
        image: "assets/Images/Beans/model2.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: ""),
    ProductModel(
        image: "assets/Images/Beans/model3.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: ""),
    ProductModel(
        image: "assets/Images/Beans/model4.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: ""),
  ];
  List<String> name = [
    "All",
    "Cappuccino",
    "Espresso",
    "Americano",
    "Macchiato"
  ];
  TextEditingController _controller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    select[0] = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "", prefix: "", suffix: ""),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(20),
              Text(
                "Find the best\ncoffee for you",
                style: TextStyle(
                    fontSize: textxxl,
                    fontWeight: FontWeight.w700,
                    color: white),
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
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(select.length, (index) {
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            select = List.generate(5, (x) => x == false);
                            select[index] = true;
                          });
                        },
                        child: Row(
                          children: [
                            Listwidget(
                              isactive: select[index],
                              name: name[index],
                            ),
                            Gap(30),
                          ],
                        ));
                  }),
                ),
              ),
              Gap(20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                child: Row(
                  children: List.generate(product.length, (index) {
                    return Row(
                      children: [
                        Choosetype(
                          item: product[index],
                          israting: true,
                        ),
                        Gap(20)
                      ],
                    );
                  }),
                ),
              ),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(productbean.length, (index) {
                    return Row(
                      children: [
                        Choosetype(
                          item: productbean[index],
                          israting: false,
                        ),
                        Gap(20)
                      ],
                    );
                  }),
                ),
              ),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
