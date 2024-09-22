import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:flutter/material.dart';

class SvgIconButton extends StatelessWidget {
  const SvgIconButton(
      {super.key, required this.svgIcon, this.onTap, this.value});
  final String svgIcon;
  final void Function()? onTap;
  final double? value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: MyIconSvg(value: value, svgIcon: svgIcon),
    );
  }
}
