import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class ChatMessageBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String time;

  const ChatMessageBubble({
    super.key,
    required this.isMe,
    required this.message,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    var radius = Radius.circular(SizeConfing.defaultSize! * 2);

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: radius,
              bottomRight: isMe ? const Radius.circular(0) : radius,
              bottomLeft: isMe ? radius : const Radius.circular(0),
              topRight: radius,
            ),
          ),
          color: isMe
              ? Theme.of(context).colorScheme.primaryContainer
              : Theme.of(context).colorScheme.secondaryContainer,
          child: Padding(
            padding: EdgeInsets.all(SizeConfing.defaultSize! * 1.2),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: SizeConfing.screenWidth! * .6,
              ),
              child: Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(message),
                  const VSpace(value: .5),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        time,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Theme.of(context).colorScheme.outline,
                            ),
                      ),
                      const HSpace(value: .5),
                      if (isMe)
                        const MyIconSvg(
                          svgIcon: Assets.svgsRead,
                          color: MyColors.readMassage,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
