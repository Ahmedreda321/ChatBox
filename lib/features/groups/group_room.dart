import 'package:chatbox/features/chat/widgets/chat_app_bar.dart';
import 'package:chatbox/features/chat/widgets/chat_message_list.dart';
import 'package:chatbox/features/chat/widgets/input_bar.dart';
import 'package:chatbox/features/groups/group_member_screen.dart';
import 'package:flutter/material.dart';

class GroupRoom extends StatelessWidget {
  const GroupRoom({super.key});
  static const String id = 'groups_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ChatAppBar(
        headerOnTap: () {
          Navigator.pushNamed(context, GroupMemberScreen.id);
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
