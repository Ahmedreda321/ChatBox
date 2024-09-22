import 'package:chatbox/features/auth/widgets/header.dart';
import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/features/home/widgets/profile_icon.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, this.headerOnTap});
  final bool selectMessage = false;
  final void Function()? headerOnTap;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: SizeConfing.screenHeight! * .1,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ProfileIcon(onTap: () {}),
          const HSpace(value: 1),
          GestureDetector(
            onTap: headerOnTap,
            child: Header(
              chat: true,
              crossAxisAlignment: CrossAxisAlignment.start,
              top: 'Ahmed Reda ',
              discribtion: 'online',
              styletop: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: SizeConfing.defaultSize! * 1.7,
                  ),
              stylediscribtion:
                  Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.outline,
                      ),
            ),
          ),
        ],
      ),
      actions: selectMessage
          ? [
              const SvgIconButton(svgIcon: Assets.svgsTrash),
              const HSpace(value: 1),
              const SvgIconButton(svgIcon: Assets.svgsCopy),
              const HSpace(value: 1),
            ]
          : null,
      automaticallyImplyLeading: false,
      scrolledUnderElevation: 0,
      leading: SvgIconButton(
          onTap: () {
            Navigator.pop(context);
          },
          svgIcon: Assets.svgsBackArrow),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfing.defaultSize! * 8);
}
