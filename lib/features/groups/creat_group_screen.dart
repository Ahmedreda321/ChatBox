import 'package:chatbox/features/auth/widgets/my_text_fild.dart';
import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class CreatGroupScreen extends StatelessWidget {
  CreatGroupScreen({super.key});
  static const String id = 'creat_group_page';
  final groupNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: SvgIconButton(
            onTap: () {
              Navigator.pop(context);
            },
            value: 1,
            svgIcon: Assets.svgsBackArrow),
        title: const Text(
          'Creat Group',
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(SizeConfing.defaultSize! * 1),
        child: Column(
          children: [
            Row(
              children: [
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      radius: SizeConfing.defaultSize! * 3.7,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        radius: SizeConfing.defaultSize! * 1.2,
                        child: const SvgIconButton(
                          onTap: null,
                          svgIcon: Assets.svgsAddIcon,
                          value: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                const HSpace(value: 1),
                Expanded(
                  child: MyTextFild(
                      controller: groupNameController,
                      prefixIcon: const Icon(Icons.group),
                      labelText: 'Group Name'),
                ),
              ],
            ),
            const VSpace(value: 1),
            Divider(
              endIndent: SizeConfing.screenWidth! * .02,
              indent: SizeConfing.screenWidth! * .02,
            ),
            Text('Members', style: Theme.of(context).textTheme.titleSmall),
            Expanded(
                child: ListView(
              children: const [
                CheckboxListTile(
                  value: false,
                  onChanged: (null),
                  title: Text('Add members'),
                ),
              ],
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('done'),
        icon: const SvgIconButton(
          onTap: null,
          svgIcon: Assets.svgsAddIcon,
          value: 3,
        ),
      ),
    );
  }
}
