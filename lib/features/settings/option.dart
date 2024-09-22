import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class Option extends StatelessWidget {
  const Option({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.onTap,
    this.trailing,
  });
  final String title, icon, subtitle;

  final Widget? trailing;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return ListTile(
      onTap: onTap,
      titleTextStyle: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
      subtitleTextStyle: Theme.of(context)
          .textTheme
          .labelMedium!
          .copyWith(color: MyColors.grey),
      leading: CircleAvatar(
        //   backgroundColor: Theme.of(context).colorScheme.primary,
        radius: SizeConfing.defaultSize! * 3,
        child: MyIconSvg(
          svgIcon: icon,
          value: SizeConfing.defaultSize! * .25,
        ),
        // child: Image.asset(ana, fit: BoxFit.cover),
      ),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: trailing,
    );
  }
}
