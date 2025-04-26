import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Pages/Cart/CartScreen.dart';
import 'package:coffeeshopapp/Pages/Fav/FavouriteScreen.dart';
import 'package:coffeeshopapp/Pages/Home/HomeScreen.dart';
import 'package:coffeeshopapp/Pages/Order%20History/OrderHistory.dart';
import 'package:coffeeshopapp/Widget/CustomApp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Navbottomscreen extends StatefulWidget {
  const Navbottomscreen({super.key});

  @override
  State<Navbottomscreen> createState() => _NavbottomscreenState();
}

class _NavbottomscreenState extends State<Navbottomscreen> {
  int selectedindex = 0;
  String title = "";
  final pages = [
    Homescreen(),
    const Cartscreen(),
    const Favouritescreen(),
    const Orderhistory()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        ismain: true,
        prefix: "assets/Icons/menu.svg",
        suffix: "assets/Images/profile.avif",
        opactiy: 0,
        Title: title,
      ),
      body: pages[selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: black,
        onTap: (val) {
          setState(() {
            selectedindex = val;
            if (selectedindex == 0) {
              title = "";
            } else if (selectedindex == 1) {
              title = "Cart";
            } else if (selectedindex == 2) {
              title = "Favorites";
            } else if (selectedindex == 3) {
              title = "Payment";
            }
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/Icons/Home.svg",
                  color: selectedindex == 0 ? orange : white,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/Icons/shop.svg",
                  color: selectedindex == 1 ? orange : white,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/Icons/fav.svg",
                  color: selectedindex == 2 ? orange : white,
                ),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: SvgPicture.asset(
                  "assets/Icons/notifiacation.svg",
                  color: selectedindex == 3 ? orange : white,
                ),
              ),
              label: ''),
        ],
      ),
    );
  }
}
