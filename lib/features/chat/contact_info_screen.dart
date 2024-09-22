import 'package:chatbox/features/auth/widgets/header.dart';
import 'package:chatbox/features/auth/widgets/mybotton.dart';
import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/features/home/widgets/mybox.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class ContactInfoScreen extends StatelessWidget {
  const ContactInfoScreen({super.key});
  static const String id = 'contact_info';
  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: SvgIconButton(
          svgIcon: Assets.svgsBackArrow,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: SizeConfing.screenWidth! * .17,
            backgroundColor: MyColors.grey,
          ),
          const Header(top: 'Contact Info', discribtion: 'Contact Info'),
          Expanded(
            child: MyBox(
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyBotton(text: 'Block', onPressed: () {}),
                  MyBotton(text: 'report', onPressed: () {}),
                  MyBotton(text: 'Delete', onPressed: () {}),
                  MyBotton(text: 'Delete Chat', onPressed: () {}),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
