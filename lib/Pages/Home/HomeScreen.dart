import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Model/product_model.dart';
import 'package:coffeeshopapp/Pages/Home/productdetails.dart';
import 'package:coffeeshopapp/Widget/Listnames.dart';
import 'package:coffeeshopapp/Widget/choosetype.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<bool> select = List.generate(5, (x) => x == false);
  List<ProductModel> product = [
    ProductModel(
        image:
            "https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615198/model3_o7staa.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: "4.5",
        location: 'Milk',
        Description:
            'Cappuccino is a latte made with more foam than steamed milk, often with a sprinkle of cocoa powder or cinnamon on top.',
        largeimage:
            'https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model10_vlymao.png',
        iconbeantype: 'assets/Icons/Bean.svg',
        iconlocationtype: 'assets/Icons/Drop.svg',
        type: 'Coffe'),
    ProductModel(
        image:
            "https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model2_ym3qat.png",
        name: "Cappuccino",
        namesmall: "With Foam",
        price: "4.20",
        rate: "4.2",
        location: 'Milk',
        Description:
            'Cappuccino is like a latte, but with more foam and less steamed milk—often topped with a dash of cocoa powder or cinnamon.',
        largeimage:
            'https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model2_t22xbd.jpg',
        iconbeantype: 'assets/Icons/Bean.svg',
        iconlocationtype: 'assets/Icons/Drop.svg',
        type: 'Coffe'),
    ProductModel(
        image:
            "https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615198/model3_o7staa.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: "4.5",
        location: 'Milk',
        Description:
            'Cappuccino is like a latte but with extra foam and less steamed milk, usually topped with a dash of cocoa powder or cinnamon.',
        largeimage:
            'https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model10_vlymao.png',
        iconbeantype: 'assets/Icons/Bean.svg',
        iconlocationtype: 'assets/Icons/Drop.svg',
        type: 'Coffe'),
  ];
  List<ProductModel> productbean = [
    ProductModel(
        image:
            "https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model3_kpezqw.jpg",
        name: "Robusta Beans",
        namesmall: "Medium Roasted",
        price: "4.20",
        rate: "4.5",
        location: 'Africa',
        Description:
            'Arabica beans are by far the most popular type of coffee beans, making up about 60% of the world’s coffee. These tasty beans originated many centuries ago in the highlands of Ethiopia, and may even be the first coffee beans ever consumed! ',
        largeimage:
            'https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model3_kpezqw.jpg',
        iconbeantype: 'assets/Icons/Beans.svg',
        iconlocationtype: 'assets/Icons/location.svg',
        type: 'Bean'),
    ProductModel(
        image:
            "https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615196/model10_rvfppi.png",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: "4.5",
        location: 'Eurpoe',
        Description:
            'Arabica beans are the most loved coffee beans in the world, accounting for around 60% of global coffee production. They first grew centuries ago in Ethiopia’s highlands and are believed to be the very first type of coffee ever enjoyed!',
        largeimage:
            'https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615196/model10_rvfppi.png',
        iconbeantype: 'assets/Icons/Beans.svg',
        iconlocationtype: 'assets/Icons/location.svg',
        type: 'Bean'),
    ProductModel(
        image:
            "https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615196/model2_t2zqng.jpg",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: "4.5",
        location: 'Australia',
        iconbeantype: 'assets/Icons/Beans.svg',
        iconlocationtype: 'assets/Icons/location.svg',
        type: 'Bean',
        Description:
            'Arabica beans are the world’s favorite coffee beans — they make up around 60% of global coffee production! These flavorful beans trace their roots back to the Ethiopian highlands, and they might even be the first type of coffee humans ever drank.',
        largeimage:
            'https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615196/model2_t2zqng.jpg'),
    ProductModel(
        image:
            "https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model4_ddtd4t.webp",
        name: "Cappuccino",
        namesmall: "With Steamed Milk",
        price: "4.20",
        rate: "4.6",
        location: 'South America',
        largeimage:
            'https://res.cloudinary.com/dp8a0acyb/image/upload/v1745615197/model4_ddtd4t.webp',
        Description:
            'Arabica beans are the most widely consumed coffee beans in the world, accounting for around 60% of global coffee production. Originating from the Ethiopian highlands centuries ago, they’re believed to be the first type of coffee beans ever enjoyed by humans.',
        iconbeantype: 'assets/Icons/Beans.svg',
        iconlocationtype: 'assets/Icons/location.svg',
        type: 'Bean'),
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
                ProductModel item = product[index];

                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        CupertinoPageRoute(builder: (BuildContext context) {
                      return Productdetails(
                        product: item,
                        size: item.sizecap,
                      );
                    }));
                  },
                  child: Row(
                    children: [
                      Choosetype(
                        item: product[index],
                        israting: true,
                      ),
                      Gap(20)
                    ],
                  ),
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
                ProductModel item = productbean[index];
                return Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            CupertinoPageRoute(builder: (BuildContext context) {
                          return Productdetails(
                            product: item,
                            size: item.size,
                          );
                        }));
                      },
                      child: Choosetype(
                        item: productbean[index],
                        israting: false,
                      ),
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
    );
  }
}
