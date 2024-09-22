import 'package:chatbox/core/utils/constes.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class ProfileIcon extends StatelessWidget {
  const ProfileIcon({
    required this.onTap,
    super.key,
  });
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: SizeConfing.defaultSize! * 2.3,
        child: Image.asset(ana),
      ),
    );
  }
}
