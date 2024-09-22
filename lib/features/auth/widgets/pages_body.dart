import 'package:chatbox/features/auth/widgets/head_title.dart';
import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/svgs.dart';

import 'package:flutter/material.dart';

class PagesBody extends StatelessWidget {
  const PagesBody({
    super.key,
    required this.body,
    // this.formKey,
    this.title,
    this.showBackIcon = false,
    this.rights = false,
    this.leading = const SizedBox(),
    this.backgroundColor,
    this.leadingWidth,
    this.bottomNavigationBar,
    this.actions,
    this.padding = true,
    this.flexibleSpace,
    this.appBarBackgroundColor,
  });

  final List<Widget> body;
  final String? title;
  final bool showBackIcon;
  final bool rights;
  final bool padding;
  final Color? appBarBackgroundColor;
  final Color? backgroundColor;
  final Widget? leading;
  final Widget? bottomNavigationBar;
  final Widget? flexibleSpace;
  final double? leadingWidth;
  final List<Widget>? actions;
  // final GlobalKey<FormState>? formKey;
  @override
  Widget build(BuildContext context) {
    // SizeConfing().init(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        bottomNavigationBar: bottomNavigationBar,
        appBar: AppBar(
          toolbarHeight: SizeConfing.screenHeight! * .1,
          flexibleSpace: flexibleSpace,
          actions: actions,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          leadingWidth: leadingWidth,
          leading: showBackIcon
              ? GestureDetector(
                  child: const MyIconSvg(svgIcon: Assets.svgsBackArrow),
                  onTap: () {
                    Navigator.pop(context);
                  },
                )
              : leading,
          backgroundColor:
              appBarBackgroundColor ?? Theme.of(context).colorScheme.surface,
          elevation: 0,
          centerTitle: true,
          title: title != null
              ? HeadTitle(
                  title: title!,
                )
              : null,
        ),
        backgroundColor:
            backgroundColor ?? Theme.of(context).colorScheme.surface,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                padding: padding
                    ? EdgeInsets.symmetric(
                        horizontal: SizeConfing.defaultSize! * 2,
                      )
                    : null,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: body,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
