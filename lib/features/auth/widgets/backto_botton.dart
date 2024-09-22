import 'package:chatbox/core/utils/space_widget.dart';
import 'package:flutter/material.dart';

class BackToBotton extends StatelessWidget {
  const BackToBotton({
    super.key,
    required this.screenName,
    required this.screen,
  });
  final String screenName;
  final String screen;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.pushNamedAndRemoveUntil(context, screen, (route) => false,
            arguments: screen);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.arrow_back,
          ),
          const HSpace(value: 1),
          Text(
            screenName,
            style: Theme.of(context).textTheme.labelLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}
