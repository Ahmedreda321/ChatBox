import 'package:flutter/material.dart';

class Forgot extends StatelessWidget {
  const Forgot({
    super.key,
    required this.onPressed,
  });
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Forgot Password?',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ],
    );
  }
}
