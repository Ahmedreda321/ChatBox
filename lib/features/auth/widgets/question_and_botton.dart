import 'package:chatbox/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

class QuestionAndBotton extends StatelessWidget {
  const QuestionAndBotton({
    super.key,
    required this.question,
    this.screenName,
    required this.bottonText,
    this.isLogin = false,
  });
  final String question;
  final String? screenName;
  final bool isLogin;
  final String bottonText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(question, style: Theme.of(context).textTheme.labelMedium),
        TextButton(
          onPressed: () {
            isLogin
                ? Navigator.pushNamedAndRemoveUntil(
                    context, LoginScreen.id, (Route route) => false)
                : Navigator.pushNamed(context, screenName!);
          },
          child: Text(
            bottonText,
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
        )
      ],
    );
  }
}
