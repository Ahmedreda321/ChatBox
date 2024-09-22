import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  final int currentIndex;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        onTap(index);
      },
      destinations: [
        NavigationDestination(
          icon: MyIconSvg(
            svgIcon: Assets.svgsChats,
            color: currentIndex == 0
                ? null
                : Theme.of(context).colorScheme.inverseSurface,
          ),
          label: 'Chats',
        ),
        NavigationDestination(
          icon: MyIconSvg(
            value: 3.5,
            svgIcon: Assets.svgsGroup,
            color: currentIndex == 1
                ? null
                : Theme.of(context).colorScheme.inverseSurface,
          ),
          label: 'Groups',
        ),
        NavigationDestination(
          icon: MyIconSvg(
            svgIcon: Assets.svgsUser,
            color: currentIndex == 2
                ? null
                : Theme.of(context).colorScheme.inverseSurface,
          ),
          label: 'Contacts',
        ),
        NavigationDestination(
          icon: MyIconSvg(
            value: 2.5,
            svgIcon: Assets.svgsAccountSettings,
            color: currentIndex == 3
                ? null
                : Theme.of(context).colorScheme.inverseSurface,
          ),
          label: 'Settings',
        ),
      ],
    );
  }
}
