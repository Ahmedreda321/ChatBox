import 'package:chatbox/core/utils/borders.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class MyOtpTextField extends StatelessWidget {
  const MyOtpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Pinput(
      length: 4,
      defaultPinTheme: PinTheme(
        textStyle: TextStyle(
          color: Theme.of(context).colorScheme.secondary,
          fontSize: SizeConfing.defaultSize! * 3.5,
          fontWeight: FontWeight.bold,
        ),
        width: SizeConfing.screenWidth! * .2,
        height: SizeConfing.screenHeight! * .1,
        decoration: BoxDecoration(
          borderRadius: myBorderRadius,
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary,
              width: SizeConfing.defaultSize! * 0.2),
        ),
      ),
    );
  }
}
