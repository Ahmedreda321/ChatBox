import 'package:chatbox/features/auth/widgets/input_field_widget.dart';
import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/features/home/widgets/mybox.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';
import '../../../core/helper/bottom_sheet_helper.dart';

class ChatInputBar extends StatelessWidget {
  const ChatInputBar({super.key});

  @override
  Widget build(BuildContext context) {
    Widget child = MyBox(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfing.screenWidth! * .02,
        ),
        child: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VSpace(value: 15),
          ],
        ),
      ),
    );
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeConfing.screenWidth! * .03,
          ),
          child: GestureDetector(
            onTap: () {
              showBottomhelperSheet(context, child);
            },
            child: const MyIconSvg(svgIcon: Assets.svgsAttachment),
          ),
        ),
        Expanded(
          child: Card(
            child: InputFieldWidget(
              suffixIcon: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: const MyIconSvg(
                    svgIcon: Assets.svgsFiles,
                    value: 2,
                  ),
                ),
              ),
              hintText: 'Message',
            ),
          ),
        ),
        IconButton.filledTonal(
          icon: const MyIconSvg(svgIcon: Assets.svgsSend),
          onPressed: () {},
        )
      ],
    );
  }
}
