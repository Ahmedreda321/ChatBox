import 'package:chatbox/core/utils/borders.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class MyTextFild extends StatefulWidget {
  const MyTextFild({
    super.key,
    required this.labelText,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.validator,
  });

  final String labelText;
  final Widget? prefixIcon, suffixIcon;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<MyTextFild> createState() => _MyTextFildState();
}

class _MyTextFildState extends State<MyTextFild> {
  bool hasError = false;

  @override
  Widget build(BuildContext context) {
    final outlineInputBorder = OutlineInputBorder(
      borderRadius: myBorderRadius2,
      borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
    );

    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfing.defaultSize! * 1,
      ),
      child: TextFormField(
        onChanged: widget.onChanged,
        controller: widget.controller,
        validator: (value) {
          String? validationResult = widget.validator?.call(value);
          setState(() {
            hasError = validationResult != null;
          });
          return validationResult;
        },
        cursorColor: Theme.of(context).colorScheme.primary,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
          errorBorder: OutlineInputBorder(
            borderRadius: myBorderRadius2,
            borderSide: BorderSide(color: Theme.of(context).colorScheme.error),
          ),
          labelStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                color: hasError
                    ? Theme.of(context).colorScheme.error
                    : Theme.of(context).colorScheme.primary,
              ),
          labelText: widget.labelText,
        ),
      ),
    );
  }
}
