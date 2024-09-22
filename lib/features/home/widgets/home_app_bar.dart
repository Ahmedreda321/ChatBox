import 'package:chatbox/logic/cubits/home_cubit/home_cubit.dart';
import 'package:chatbox/features/home/widgets/profile_icon.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chatbox/features/auth/widgets/head_title.dart';
import 'package:chatbox/features/home/widgets/app_bar_icon.dart';
import 'package:chatbox/logic/cubits/screens/search_screen.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const HomeAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      leading: MyAppBarIcons(
        svg: Assets.svgsSearch,
        onTap: () => Navigator.pushNamed(context, SearchScreen.id),
      ),
      actions: _buildActions(context),
      title: HeadTitle(title: title),
      centerTitle: true,
      leadingWidth: SizeConfing.defaultSize! * 9,
      toolbarHeight: SizeConfing.screenHeight! * .1,
    );
  }

  List<Widget>? _buildActions(BuildContext context) {
    return context.watch<HomeCubit>().state.currentIndex == 0
        ? [ProfileIcon(onTap: () {}), const HSpace(value: 3)]
        : null;
  }

  @override
  Size get preferredSize => Size.fromHeight(SizeConfing.screenHeight! * .1);
}
