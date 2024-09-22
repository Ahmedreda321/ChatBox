import 'package:chatbox/features/chat/widgets/chat_message_bubble.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class ChatMessageList extends StatelessWidget {
  const ChatMessageList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfing.screenWidth! * .02,
      ),
      child: ListView.builder(
        reverse: true,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ChatMessageBubble(
            isMe: index % 2 != 0,
            message:
                'sdsadsdassdjhskdjhcjkdshcksdjhskdjhcjkdshcksjgdjc;lsdchlcda',
            time: '10:00',
          );
        },
      ),
    );
  }
}
