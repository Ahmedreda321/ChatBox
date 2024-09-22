// File: lib/screens/chat/chat_room.dart
import 'package:chatbox/features/chat/contact_info_screen.dart';
import 'package:chatbox/features/chat/widgets/chat_app_bar.dart';
import 'package:chatbox/features/chat/widgets/chat_message_list.dart';
import 'package:chatbox/features/chat/widgets/input_bar.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatelessWidget {
  const ChatRoom({super.key});

  static const String id = 'message_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        headerOnTap: () {
          Navigator.pushNamed(context, ContactInfoScreen.id);
        },
      ),
      body: const Column(
        children: [
          Expanded(
            child: ChatMessageList(),
          ),
          Divider(),
          ChatInputBar(),
        ],
      ),
    );
  }
}
