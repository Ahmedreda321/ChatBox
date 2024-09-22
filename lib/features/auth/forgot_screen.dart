// ignore_for_file: deprecated_member_use, use_build_context_synchronously

import 'package:chatbox/features/auth/login_screen.dart';
import 'package:chatbox/features/auth/widgets/backto_botton.dart';
import 'package:chatbox/features/auth/widgets/header.dart';
import 'package:chatbox/features/auth/widgets/my_text_fild.dart';
import 'package:chatbox/features/auth/widgets/mybotton.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:chatbox/features/auth/widgets/pages_body.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});
  static const String id = 'ForgotScreen';

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PagesBody(body: [
      SvgPicture.asset(Assets.svgsKey,
          height: SizeConfing.defaultSize! * 5,
          color: Theme.of(context).colorScheme.secondary),
      const VSpace(
        value: 2,
      ),
      const Header(
          top: 'Forgot Your Password?',
          discribtion:
              'A code will be sent to your email address to help reset your password'),
      const VSpace(
        value: 2,
      ),
      Form(
        key: _formKey,
        child: Column(
          children: [
            MyTextFild(
                controller: _emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                labelText: 'Inter your Email Address'),
            const VSpace(
              value: 2,
            ),
            MyBotton(
              text: 'Send Code',
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  try {
                    await FirebaseAuth.instance
                        .sendPasswordResetEmail(
                          email: _emailController.text,
                        )
                        .then(
                          (value) => ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Message sent successfully'),
                            ),
                          ),
                        )
                        .then(
                          (value) => Navigator.pop(context),
                        );
                  } catch (error) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          error.toString(),
                        ),
                      ),
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
      const VSpace(
        value: 2,
      ),
      BackToBotton(
        screen: LoginScreen.id,
        screenName: 'Back to Login',
      )
    ]);
  }
}
