import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Pages/Cart/Payment.dart';
import 'package:coffeeshopapp/Controller/Provider/CartScreenProvider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatelessWidget {
  const Cartscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Consumer<Cartscreenprovider>(
            builder: (BuildContext context, Cartscreenprovider, Widget? child) {
              return ListView.builder(
                itemCount: Cartscreenprovider.widgets.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return Cartscreenprovider.widgets[index];
                },
              );
            },
          ),
        ),
        Positioned(
          bottom: 0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        "Total Price",
                        style: TextStyle(
                            fontSize: texts,
                            color: Color(
                              0xffAEAEAE,
                            ),
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Text(
                            "\$ ",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: orange,
                                fontSize: 20),
                          ),
                          Consumer<Cartscreenprovider>(
                            builder: (BuildContext context, cartprovider,
                                Widget? child) {
                              return Text(
                                cartprovider.tot.toStringAsFixed(2),
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: white,
                                    fontSize: 20),
                              );
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          CupertinoPageRoute(builder: (BuildContext context) {
                        return PaymentScreen();
                      }));
                    },
                    child: Container(
                      width: 240,
                      height: 60,
                      decoration: BoxDecoration(
                          color: orange,
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Pay",
                          style: TextStyle(
                              fontSize: 16,
                              color: white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
