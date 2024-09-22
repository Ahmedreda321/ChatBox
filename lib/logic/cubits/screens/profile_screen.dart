import 'package:chatbox/features/auth/widgets/header.dart';
import 'package:chatbox/features/auth/widgets/input_field_widget.dart';
import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/features/auth/widgets/mybotton.dart';
import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/features/home/widgets/mybox.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String id = 'profile_screen';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = 'Ahmed reda';
    bioController.text = 'Flutter Developer';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          leading: SvgIconButton(
              svgIcon: Assets.svgsBackArrow,
              onTap: () {
                Navigator.pop(context);
              }),
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
        body: Column(
          children: [
            const ProfileAvatar(),
            Header(top: nameController.text, discribtion: bioController.text),
            Expanded(
              child: MyBox(
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      ProfileDetails(
                        leading: Assets.svgsUser,
                        controller: nameController,
                        label: 'Name',
                        trailing: Assets.svgsEdit,
                      ),
                      ProfileDetails(
                        leading: Assets.svgsInfo,
                        controller: bioController,
                        label: 'Bio',
                        trailing: Assets.svgsEdit,
                      ),
                      const ListTile(
                        leading: MyIconSvg(
                          value: 3,
                          svgIcon: Assets.svgsGmail,
                        ),
                        title: Text('email'),
                        subtitle: Text('Ybq5Z@example.com'),
                      ),
                      const ListTile(
                        leading: MyIconSvg(
                          value: 3,
                          svgIcon: Assets.svgsTimer,
                        ),
                        title: Text('Join on'),
                        subtitle: Text('10/10/2022'),
                      ),
                      MyBotton(text: 'Save', onPressed: () {}),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({
    super.key,
    required this.controller,
    this.leading,
    this.label,
    this.trailing,
  });
  final String? leading, label, trailing;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading == null
          ? null
          : MyIconSvg(
              value: 3,
              svgIcon: leading!,
            ),
      title: InputFieldWidget(
        fillColor: Colors.transparent,
        controller: controller,
        enabled: true,
        label: label != null ? Text(label!) : null,
      ),
      trailing: trailing != null
          ? IconButton(
              onPressed: () {},
              icon: MyIconSvg(value: 3, svgIcon: trailing!),
            )
          : null,
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  const ProfileAvatar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: SizeConfing.screenWidth! * .15,
          backgroundColor: MyColors.grey,
        ),
        Positioned(
          bottom: -SizeConfing.screenHeight! * .01,
          right: -SizeConfing.screenWidth! * .004,
          child: IconButton.filled(
            onPressed: () {},
            icon: MyIconSvg(
              color: Theme.of(context).colorScheme.surface,
              svgIcon: Assets.svgsCamera,
            ),
          ),
        )
      ],
    );
  }
}
