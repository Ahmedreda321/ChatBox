import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class MyBox extends StatelessWidget {
  const MyBox({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return Container(
      padding: EdgeInsets.only(
          top: SizeConfing.screenHeight! * .065,
          right: SizeConfing.screenWidth! * .02,
          left: SizeConfing.screenWidth! * .02),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Theme.of(context).colorScheme.onSecondaryContainer,
            width: 3.0,
          ),
        ),
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(SizeConfing.defaultSize! * 6),
          topRight: Radius.circular(SizeConfing.defaultSize! * 6),
        ),
      ),
      child: body,
    );
  }
}
