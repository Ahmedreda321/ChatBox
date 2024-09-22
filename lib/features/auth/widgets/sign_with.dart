// ignore_for_file: deprecated_member_use

import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';
import 'package:social_auth_buttons/social_auth_buttons.dart';

class SignWithGoogel extends StatelessWidget {
  const SignWithGoogel({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GoogleAuthButton(
      style: AuthButtonStyle.icon,
      iconSize: SizeConfing.defaultSize! * 3,
      height: SizeConfing.screenHeight! * 0.06,
      borderRadius: SizeConfing.defaultSize! * 5,
      onPressed: onPressed,
      buttonColor: Theme.of(context).colorScheme.background,
      borderWidth: SizeConfing.defaultSize! * 0.1,
    );
  }
}

class SignWithFacebook extends StatelessWidget {
  const SignWithFacebook({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return FacebookAuthButton(
      style: AuthButtonStyle.icon,
      iconSize: SizeConfing.defaultSize! * 3,
      height: SizeConfing.screenHeight! * 0.06,
      borderRadius: SizeConfing.defaultSize! * 5,
      onPressed: onPressed,
      buttonColor: Theme.of(context).colorScheme.background,
      borderWidth: SizeConfing.defaultSize! * 0.1,
    );
  }
}
