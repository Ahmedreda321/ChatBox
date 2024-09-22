// ignore_for_file: use_build_context_synchronously

import 'package:chatbox/features/auth/login_screen.dart';
import 'package:chatbox/features/auth/widgets/header.dart';
import 'package:chatbox/features/auth/widgets/mybotton.dart';
import 'package:chatbox/features/chat/widgets/svg_icon_botton.dart';
import 'package:chatbox/features/home/widgets/mybox.dart';
import 'package:chatbox/logic/cubits/screens/profile_screen.dart';
import 'package:chatbox/logic/cubits/screens/qrcode_screen.dart';
import 'package:chatbox/features/settings/option.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfing().init(context);
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: MyBox(
        body: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfing.screenWidth! * .05),
                  child: CircleAvatar(
                    radius: SizeConfing.screenWidth! * .1,
                  ),
                ),
                const Header(top: 'Name', discribtion: 'bio'),
                const Spacer(),
                Padding(
                  padding:
                      EdgeInsets.only(right: SizeConfing.screenWidth! * .05),
                  child: SvgIconButton(
                      svgIcon: Assets.svgsQr,
                      onTap: () {
                        Navigator.of(context).pushNamed(QRCodeScreen.id);
                      }),
                )
              ],
            ),
            const Divider(),
            Option(
              onTap: () {
                Navigator.of(context).pushNamed(ProfileScreen.id);
              },
              title: 'Account',
              subtitle: 'Privacy, security, change number and more...',
              icon: Assets.svgsKey,
            ),
            Option(
              onTap: () {},
              title: 'Notifications',
              subtitle: 'Message, group and call tones',
              icon: Assets.svgsNotifications,
            ),
            Option(
              onTap: () {},
              title: 'Storage and data',
              subtitle: 'Network usage, auto-download',
              icon: Assets.svgsAlarmIcon,
            ),
            Option(
              onTap: () {},
              title: 'Dark mode',
              subtitle: '',
              trailing: Switch(
                value: false,
                onChanged: (value) {},
              ),
              icon: Assets.svgsAlarmIcon,
            ),
            const Spacer(),
            MyBotton(
              text: 'Sign out',
              onPressed: () {
                _showLogoutConfirmationDialog(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void _showLogoutConfirmationDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Logout'),
          content: const Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () async {
                await FirebaseAuth.instance.signOut().then(
                  (value) {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.id, (route) => false);
                  },
                );
              },
              child: const Text('Yes, Sign out'),
            ),
          ],
        );
      },
    );
  }
}
