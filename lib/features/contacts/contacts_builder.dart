import 'package:chatbox/features/chat/chat_room.dart';
import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/features/home/widgets/mybox.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({
    super.key,
  });
  static const String id = 'ContactsScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: MyBox(
        body: ListView.builder(
          itemCount: 15,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                leading: const CircleAvatar(),
                title: const Text('Name'),
                subtitle: const Text('Discription'),
                trailing: SvgIconButton(
                    onTap: () {
                      Navigator.pushNamed(context, ChatRoom.id);
                    },
                    svgIcon: Assets.svgsChats),
              ),
            );
          },
        ),
      ),
    );
  }
}
