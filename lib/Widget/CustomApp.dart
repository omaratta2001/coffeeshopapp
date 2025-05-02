// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffeeshopapp/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar(
      {super.key,
      required this.prefix,
      required this.suffix,
      this.ontap,
      required this.ismain,
      required this.opactiy,
      required this.Title,
      this.havesuffix = true,
      this.ontapsuffix,
      this.isfav = true});
  final bool isfav;
  final bool havesuffix;
  final String Title;
  final double opactiy;
  final bool ismain;
  final String prefix;
  final String suffix;
  final Function()? ontap;
  final Function()? ontapsuffix;

  @override
  Size get preferredSize => Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      toolbarHeight: preferredSize.height,
      leadingWidth: 0.0,
      leading: SizedBox.shrink(),
      scrolledUnderElevation: 0.0,
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: ontap,
              child: Container(
                width: 50,
                height: 50,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff21262E), width: 1),
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff21262E).withOpacity(1),
                      Color(0xff21262E).withOpacity(opactiy),
                    ],
                    stops: [0.0, 1.0],
                  ),
                ),
                child: Opacity(
                    opacity: 0.18,
                    child: SvgPicture.asset(
                      prefix,
                    )),
              ),
            ),
            Text(
              Title,
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w700, color: white),
            ),
            havesuffix
                ? ismain
                    ? GestureDetector(
                        onTap: ontapsuffix,
                        child: Container(
                          width: 50,
                          height: 50,
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff21262E), width: 1),
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: AssetImage(
                                    suffix,
                                  ),
                                  fit: BoxFit.fill)),
                        ),
                      )
                    : GestureDetector(
                        onTap: ontapsuffix,
                        child: Container(
                            width: 50,
                            height: 50,
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xff21262E), width: 1),
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0xff21262E).withOpacity(1),
                                  Color(0xff21262E).withOpacity(opactiy),
                                ],
                                stops: [0.0, 1.0],
                              ),
                            ),
                            child: !isfav
                                ? Opacity(
                                    opacity: 0.18,
                                    child: SvgPicture.asset(
                                      suffix,
                                      color: null,
                                    ))
                                : SvgPicture.asset(
                                    suffix,
                                    color: red,
                                  )),
                      )
                : Container(
                    width: 40,
                    height: 50,
                  )
          ],
        ),
      ),
    );
  }
}
