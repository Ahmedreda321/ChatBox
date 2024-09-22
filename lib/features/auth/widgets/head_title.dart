import 'package:flutter/material.dart';

class HeadTitle extends StatelessWidget {
  const HeadTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontWeight: FontWeight.bold,
          ),
    );
  }
}
