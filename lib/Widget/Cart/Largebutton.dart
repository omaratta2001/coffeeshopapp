import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Model/Cartmodel.dart';
import 'package:coffeeshopapp/Controller/Provider/CartScreenProvider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

// class LargeButton1 extends StatelessWidget {
//   final int widgetindex;
//   final int productid;

//   const LargeButton1(
//       {super.key, required this.widgetindex, required this.productid});

//   @override
//   Widget build(BuildContext context) {
//     final cartprovider = Provider.of<Cartscreenprovider>(context);
//     final Cartmodel item = cartprovider.grouped[productid]!.first;
//     return Column(
//       children: [
//         Container(
//           padding: EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(20),
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//               colors: [
//                 Color(0xff262B33).withOpacity(1),
//                 Color(0xff262B33).withOpacity(0),
//               ],
//               stops: [0.0, 1.0],
//             ),
//           ),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   ClipRRect(
//                     borderRadius: BorderRadius.all(Radius.circular(20)),
//                     child: Image.network(
//                       item.productImageUrl,
//                       fit: BoxFit.fill,
//                       width: 100,
//                       height: 100,
//                     ),
//                   ),
//                   Gap(20),
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         item.productname,
//                         style: TextStyle(fontSize: textm, color: white),
//                       ),
//                       Text(
//                         item.productsmallcaption,
//                         style: TextStyle(
//                             fontSize: textxs, color: Color(0xffAEAEAE)),
//                       ),
//                       Gap(10),
//                       Container(
//                         width: 118,
//                         height: 45,
//                         decoration: BoxDecoration(
//                           color: Color(0xff141921),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Center(
//                           child: Text(
//                             "Medium Roasted",
//                             style: TextStyle(
//                                 fontSize: textxs,
//                                 fontWeight: FontWeight.w700,
//                                 color: Color(0xffAEAEAE)),
//                           ),
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//               Gap(10),
//               for (var item in cartprovider.grouped[productid]!) ...[
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     Container(
//                       width: 72,
//                       decoration: BoxDecoration(
//                           color: black,
//                           borderRadius: BorderRadius.circular(12)),
//                       child: Center(
//                         child: Padding(
//                           padding: const EdgeInsets.all(10.0),
//                           child: Text(
//                             item.productSizename,
//                             style: TextStyle(
//                                 fontSize: textm,
//                                 color: white,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Container(
//                       child: Row(
//                         children: [
//                           Text(
//                             "\$ ",
//                             style: TextStyle(
//                                 color: orange,
//                                 fontSize: textm,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                           Text(
//                             item.price.toStringAsFixed(2),
//                             style: TextStyle(
//                                 color: white,
//                                 fontSize: textm,
//                                 fontWeight: FontWeight.w700),
//                           )
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         int groupindex = cartprovider.grouped[productid]!
//                             .indexOf(item);
//                         cartprovider.dectotlarge(
//                             groupindex, productid, widgetindex);
//                       },
//                       child: Container(
//                         width: 29,
//                         height: 29,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             color: orange,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: SvgPicture.asset(
//                           "assets/Icons/Vector-8.svg",
//                           width: 8,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                     Container(
//                         width: 50,
//                         height: 30,
//                         decoration: BoxDecoration(
//                             color: black,
//                             border: Border.all(width: 1, color: orange),
//                             borderRadius: BorderRadius.circular(8)),
//                         child: Center(
//                           child: Text(
//                             item.qty.toString(),
//                             style: TextStyle(
//                                 color: white,
//                                 fontSize: textm,
//                                 fontWeight: FontWeight.w700),
//                           ),
//                         )),
//                     GestureDetector(
//                       onTap: () async {
//                         int groupindex = cartprovider.grouped[productid]!
//                             .indexOf(item);

//                         cartprovider.increaselarge(
//                             groupindex, productid, widgetindex);
//                       },
//                       child: Container(
//                         width: 29,
//                         height: 29,
//                         padding: EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                             color: orange,
//                             borderRadius: BorderRadius.circular(10)),
//                         child: SvgPicture.asset(
//                           "assets/Icons/add.svg",
//                           width: 8,
//                           color: white,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Gap(10),
//               ],
//             ],
//           ),
//         ),
//         Gap(10),
//       ],
//     );
//   }
// }

class LargeButton1 extends StatelessWidget {
  final int widgetindex;
  final int productid;

  const LargeButton1({
    super.key,
    required this.widgetindex,
    required this.productid,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<Cartscreenprovider>(
      builder: (context, cartprovider, child) {
        final List<Cartmodel> productGroup = cartprovider.grouped[productid]!;
        final Cartmodel item = productGroup.first;

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
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildProductImage(item.productImageUrl),
                      const Gap(20),
                      _buildProductDetails(item),
                    ],
                  ),
                  const Gap(10),
                  ...productGroup.map((cartItem) {
                    final index = productGroup.indexOf(cartItem);
                    return Column(
                      children: [
                        _buildCartRow(context, cartItem, cartprovider, index),
                        const Gap(10),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
            const Gap(10),
          ],
        );
      },
    );
  }

  Widget _buildProductImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        url,
        width: 100,
        height: 100,
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildProductDetails(Cartmodel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(item.productname, style: TextStyle(fontSize: textm, color: white)),
        Text(item.productsmallcaption,
            style: TextStyle(fontSize: textxs, color: const Color(0xffAEAEAE))),
        const Gap(10),
        Container(
          width: 118,
          height: 45,
          decoration: BoxDecoration(
            color: const Color(0xff141921),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              "Medium Roasted",
              style: TextStyle(
                fontSize: textxs,
                fontWeight: FontWeight.w700,
                color: Color(0xffAEAEAE),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCartRow(BuildContext context, Cartmodel item,
      Cartscreenprovider cartprovider, int groupindex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _buildSizeBox(item.productSizename),
        _buildPriceBox(item.price),
        _buildQuantityButton(() {
          cartprovider.dectotlarge(groupindex, productid, widgetindex);
        }, "assets/Icons/Vector-8.svg"),
        _buildQuantityDisplay(item.qty),
        _buildQuantityButton(() {
          cartprovider.increaselarge(groupindex, productid, widgetindex);
        }, "assets/Icons/add.svg"),
      ],
    );
  }

  Widget _buildSizeBox(String name) {
    return Container(
      width: 72,
      decoration: BoxDecoration(
        color: black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(name,
              style: TextStyle(
                  fontSize: textm, color: white, fontWeight: FontWeight.w700)),
        ),
      ),
    );
  }

  Widget _buildPriceBox(double price) {
    return Row(
      children: [
        Text("\$ ",
            style: TextStyle(
                color: orange, fontSize: textm, fontWeight: FontWeight.w700)),
        Text(price.toStringAsFixed(2),
            style: TextStyle(
                color: white, fontSize: textm, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _buildQuantityButton(VoidCallback onTap, String iconPath) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 29,
        height: 29,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SvgPicture.asset(iconPath, width: 8, color: white),
      ),
    );
  }

  Widget _buildQuantityDisplay(int qty) {
    return Container(
      width: 50,
      height: 30,
      decoration: BoxDecoration(
        color: black,
        border: Border.all(width: 1, color: orange),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(qty.toString(),
            style: TextStyle(
                color: white, fontSize: textm, fontWeight: FontWeight.w700)),
      ),
    );
  }
}
