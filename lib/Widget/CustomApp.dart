// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.prefix,
    required this.suffix,
    this.ontap,
  }) : super(key: key);
  final String title;
  final String prefix;
  final String suffix;
  final Function()? ontap;
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
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xff21262E), width: 1),
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xff21262E).withOpacity(1),
                    Color(0xff21262E).withOpacity(0),
                  ],
                  stops: [0.0, 1.0],
                ),
              ),
              child: Opacity(
                  opacity: 0.18,
                  child: SvgPicture.asset(
                    "assets/Icons/menu.svg",
                  )),
            ),
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff21262E), width: 1),
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/Images/profile.avif",
                      ),
                      fit: BoxFit.fill)),
            ),
          ],
        ),
      ),
    );
  }
}
