import 'package:chatbox/features/chat/chat_room.dart';
import 'package:chatbox/features/chat/widgets/chat_card.dart';
import 'package:chatbox/features/home/widgets/mybox.dart';
import 'package:flutter/material.dart';

class ChatsBuilder extends StatelessWidget {
  const ChatsBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: MyBox(
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return const ChatCard(
              screenName: ChatRoom.id,
            );
          },
        ),
      ),
    );
  }
}
