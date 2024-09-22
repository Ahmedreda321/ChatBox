import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.top,
      required this.discribtion,
      this.styletop,
      this.stylediscribtion,
      this.mainAxisAlignment = MainAxisAlignment.center,
      this.chat = false,
      this.crossAxisAlignment = CrossAxisAlignment.center});
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final String top;
  final TextStyle? styletop;
  final String discribtion;
  final TextStyle? stylediscribtion;
  final bool chat;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      crossAxisAlignment: crossAxisAlignment,
      children: [
        const VSpace(value: 2),
        Text(
          top,
          style: styletop ??
              Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold),
        ),
        // const VSpace(value: 1),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxWidth: chat
                  ? SizeConfing.screenWidth! * 0.55
                  : SizeConfing.screenWidth!),
          child: Text(discribtion,
              maxLines: chat ? 1 : 5,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style:
                  stylediscribtion ?? Theme.of(context).textTheme.titleSmall),
        ),
        const VSpace(value: 2),
      ],
    );
  }
}
