import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/core/utils/borders.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyAppBarIcons extends StatelessWidget {
  MyAppBarIcons(
      {super.key, required this.onTap, required this.svg, this.color});
  final void Function()? onTap;
  final String svg;
  Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap!,
          child: Container(
            margin: EdgeInsets.only(left: SizeConfing.defaultSize! * 3),
            padding: EdgeInsets.all(SizeConfing.defaultSize! * 1),
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: circleBorder,
              border: Border.all(color: MyColors.grey),
            ),
            child: MyIconSvg(
              svgIcon: svg,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
