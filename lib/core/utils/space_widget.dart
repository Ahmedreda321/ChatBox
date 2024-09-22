import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class HSpace extends StatelessWidget {
  const HSpace({super.key, required this.value});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: SizeConfing.defaultSize! * value!,
    );
  }
}

class VSpace extends StatelessWidget {
  const VSpace({super.key, required this.value});
  final double? value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfing.defaultSize! * value!,
    );
  }
}
