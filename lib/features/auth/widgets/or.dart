import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class Or extends StatelessWidget {
  const Or({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeConfing.screenHeight! * .02,
              horizontal: SizeConfing.screenWidth! * .03),
          child: Text('OR', style: Theme.of(context).textTheme.titleSmall),
        ),
        const Expanded(child: Divider())
      ],
    );
  }
}
