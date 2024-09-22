import 'package:chatbox/core/utils/borders.dart';
import 'package:flutter/material.dart';

class MyBotton extends StatelessWidget {
  const MyBotton({
    super.key,
    required this.text,
    required this.onPressed,
    this.minimumSize,
  });
  final String text;
  final VoidCallback onPressed;
  final Size? minimumSize;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: myBorderRadius,
        ),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        minimumSize: minimumSize,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
