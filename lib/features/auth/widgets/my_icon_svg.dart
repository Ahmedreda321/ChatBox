import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyIconSvg extends StatelessWidget {
  const MyIconSvg({
    super.key,
    required this.svgIcon,
    this.value,
    this.color,
  });

  final double? value;
  final String svgIcon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return SvgPicture.asset(
      svgIcon,
      height: value != null ? SizeConfing.defaultSize! * value! : null,
      width: value != null ? SizeConfing.defaultSize! * value! : null,
      theme: color != null
          ? SvgTheme(
              currentColor: color ?? Theme.of(context).colorScheme.secondary,
            )
          : null,
      // ignore: deprecated_member_use
      color: color ?? Theme.of(context).colorScheme.secondary,
    );
  }
}
