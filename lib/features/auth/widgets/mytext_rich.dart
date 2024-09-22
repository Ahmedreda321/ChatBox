import 'package:chatbox/core/utils/space_widget.dart';
import 'package:flutter/material.dart';

class MyTextRich extends StatelessWidget {
  const MyTextRich({
    super.key,
    required this.text,
    required this.textSpan,
    required this.discribtion,
  });
  final String text;
  final String textSpan;
  final String discribtion;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const VSpace(value: 1),
        Text.rich(
          TextSpan(
              text: text,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
              children: [
                TextSpan(
                  text: textSpan,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                ),
              ]),
        ),
        const VSpace(value: 1),
        Text(
          discribtion,
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const VSpace(value: 2),
      ],
    );
  }
}
