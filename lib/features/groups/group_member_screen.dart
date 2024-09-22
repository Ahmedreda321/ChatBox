import 'package:chatbox/features/auth/widgets/mybotton.dart';
import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class GroupMemberScreen extends StatelessWidget {
  const GroupMemberScreen({super.key});

  static const String id = 'group_member_page';
  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 2,
        leading: SvgIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            value: 1,
            svgIcon: Assets.svgsBackArrow),
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfing.defaultSize! * 1),
        child: Column(
          children: [
            CircleAvatar(
              radius: SizeConfing.defaultSize! * 6,
              backgroundColor: MyColors.grey,
            ),
            Stack(clipBehavior: Clip.none, children: [
              Text(
                'group name',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              Positioned(
                top: -SizeConfing.screenHeight! * .005,
                right: -SizeConfing.screenWidth! * .055,
                child: SvgIconButton(
                    svgIcon: Assets.svgsAddIcon, value: 2, onTap: () {}),
              ),
            ]),
            Text(
              'Group description',
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
            ),
            const Divider(),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Members',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: MyColors.grey,
                    ),
                    title: const Text('Ahmed Reda'),
                    subtitle: const Text('discribtion'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Admin',
                        ),
                        SvgIconButton(
                            svgIcon: Assets.svgsTrash, value: 2, onTap: () {}),
                        const HSpace(value: 1),
                        SvgIconButton(
                            svgIcon: Assets.svgsCopy, value: 2, onTap: () {}),
                      ],
                    ),
                  );
                },
              ),
            ),
            const Divider(),
            MyBotton(text: 'Leave Group', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
