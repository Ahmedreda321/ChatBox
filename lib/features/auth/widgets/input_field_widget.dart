import 'package:chatbox/core/utils/borders.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatelessWidget {
  final String? hintText;
  final Function? onChanged;
  final Widget? suffixIcon, label;
  final bool? autofocus, enabled;
  final TextEditingController? controller;
  final Color? fillColor;
  const InputFieldWidget({
    super.key,
    this.hintText,
    this.onChanged,
    this.suffixIcon,
    this.autofocus,
    this.enabled,
    this.controller,
    this.label,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      enabled: enabled,
      autofocus: autofocus ?? false,
      minLines: 1,
      maxLines: 5,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: Theme.of(context).textTheme.titleMedium,
      decoration: InputDecoration(
        fillColor: fillColor ?? Theme.of(context).colorScheme.surface,

        label: label,
        suffixIcon: suffixIcon,

        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.titleMedium,
        filled: true,
        // fillColor: ,
        contentPadding: EdgeInsets.symmetric(
          horizontal: SizeConfing.defaultSize! * 1.5,
        ),
        border: OutlineInputBorder(
          borderRadius: myBorderRadius2,
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
