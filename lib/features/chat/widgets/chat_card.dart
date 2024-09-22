import 'package:chatbox/core/utils/constes.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key, required this.screenName});
  final String screenName;
  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, screenName);
      },
      child: Card(
        child: ListTile(
            trailing: Badge(
              backgroundColor: Theme.of(context).colorScheme.error,
              // padding: EdgeInsets.all(5),
              label: const Text(
                '3',
              ),
            ),
            leading: CircleAvatar(
              radius: SizeConfing.defaultSize! * 3,
              child: Image.asset(ana),
            ),
            title: const Text(
              'ahmed reda',
            ),
            titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                  // color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                ),
            subtitle: const Text(
              'hello, how are ',
            ),
            subtitleTextStyle:
                Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: Theme.of(context).colorScheme.outline,
                    )),
      ),
    );
  }
}
