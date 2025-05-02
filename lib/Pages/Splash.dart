import 'package:coffeeshopapp/Controller/User/UserController.dart';
import 'package:coffeeshopapp/Pages/Home/HomeScreen.dart';
import 'package:coffeeshopapp/Pages/Auth/LoginScreen.dart';
import 'package:coffeeshopapp/Pages/NavbottomScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    var done;

    Future.delayed(Duration(milliseconds: 1500), () {
      // Navigator.pushReplacement(context,
      //     MaterialPageRoute(builder: (BuildContext context) {
      //   return LoginScreen();
      // }));
      checklogin();
    });
    super.initState();
  }

  Future<void> checklogin() async {
    var done = await getprotect();
    if ('You are authorized!' == done) {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return Navbottomscreen();
      }));
    } else {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (BuildContext context) {
        return LoginScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SvgPicture.asset(
            "assets/Logo/logo.svg",
            width: 188,
          )),
          Gap(10),
        ],
      ),
    );
  }
}
