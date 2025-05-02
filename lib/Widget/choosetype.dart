// import 'package:coffeeshopapp/Constant.dart';
// import 'package:coffeeshopapp/Model/Product.dart';
// import 'package:coffeeshopapp/Model/product_model.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:gap/gap.dart';

// class Choosetype extends StatelessWidget {
//   final Product item;
//   final bool israting;
//   const Choosetype({super.key, required this.item, required this.israting});

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: 149,
//       decoration: BoxDecoration(
//         borderRadius:  BorderRadius.circular(20),
//         gradient:  LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [
//             Color(0xff262B33).withOpacity(1),
//             Color(0xff262B33).withOpacity(0),
//           ],
//           stops: [0.0, 1.0],
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: 126,
//               height: 126,
//               child: Stack(
//                 children: [
//                   ClipRRect(
//                       borderRadius: BorderRadius.circular(20),
//                       child:  Image.network(
//                         item.imageUrl,
//                         fit: BoxFit.fill,
//                         width: 126,
//                         height: 126,
//                       )),
//                   israting
//                       ? Positioned(
//                           right: 0,
//                           child: Container(
//                             padding: EdgeInsets.all(7),
//                             decoration: BoxDecoration(
//                               color: black.withOpacity(0.6),
//                               borderRadius: BorderRadius.only(
//                                   topRight: Radius.circular(20),
//                                   bottomLeft: Radius.circular(20)),
//                             ),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 SvgPicture.asset(
//                                   "assets/Icons/star.svg",
//                                   color: orange,
//                                   width: 10,
//                                 ),
//                                 Gap(5),
//                                 Text(
//                                   item.rates,
//                                   style: TextStyle(
//                                       fontSize: texts,
//                                       color: white,
//                                       fontWeight: FontWeight.w700),
//                                 )
//                               ],
//                             ),
//                           ),
//                         )
//                       : Container()
//                 ],
//               ),
//             ),
//             Gap(10),
//             Text(
//               item.name,
//               style: TextStyle(fontSize: texts, color: white),
//             ),
//             Gap(3),
//             Text(
//               item.SmallCaption,
//               style: TextStyle(fontSize: 9, color: white),
//             ),
//             Gap(13),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Text(
//                       "\$",
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: orange),
//                     ),
//                     Gap(3),
//                     Text(
//                       item.Price,
//                       style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.bold,
//                           color: white),
//                     ),
//                   ],
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(8),
//                   width: 29,
//                   height: 29,
//                   decoration: BoxDecoration(
//                       color: orange, borderRadius: BorderRadius.circular(10)),
//                   child: SvgPicture.asset("assets/Icons/add.svg"),
//                 )
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:coffeeshopapp/Constant.dart';
import 'package:coffeeshopapp/Model/Product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class Choosetype extends StatelessWidget {
  final Product item;
  final bool israting;

  const Choosetype({super.key, required this.item, required this.israting});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      width: 149,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff262B33).withOpacity(1),
            Color(0xff262B33).withOpacity(0),
          ],
          stops: [0.0, 1.0],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  FadeInImage.assetNetwork(
                    placeholder:
                        "assets/Icons/placeholder.png", // اعمل Placeholder بسيط
                    image: item.imageUrl,
                    fit: BoxFit.cover,
                    width: 126,
                    height: 126,
                  ),
                  if (israting)
                    Positioned(
                      right: 0,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                        decoration: BoxDecoration(
                          color: black.withOpacity(0.6),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/Icons/star.svg",
                              color: orange,
                              width: 12,
                            ),
                            Gap(5),
                            Text(
                              item.rates,
                              style: TextStyle(
                                fontSize: texts,
                                color: white,
                                fontWeight: FontWeight.w700,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                ],
              ),
            ),
            Gap(12),
            Text(
              item.name,
              style: TextStyle(
                fontSize: texts,
                color: white,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Gap(4),
            Text(
              item.SmallCaption,
              style: TextStyle(
                fontSize: 9,
                color: white.withOpacity(0.7),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Gap(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: orange,
                      ),
                    ),
                    Gap(3),
                    Text(
                      item.Price,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: white,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: orange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/Icons/add.svg",
                      width: 16,
                      height: 16,
                      color: white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
