import 'package:chatbox/core/utils/borders.dart';
import 'package:chatbox/core/utils/colors.dart';
import 'package:chatbox/core/utils/size_confing.dart';
import 'package:flutter/material.dart';

class PasswordFild extends StatefulWidget {
  const PasswordFild({
    super.key,
    required this.labelText,
    this.controller,
    this.onChanged,
    this.validator,
  });

  final String labelText;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  State<PasswordFild> createState() => _PasswordFildState();
}

class _PasswordFildState extends State<PasswordFild> {
  bool isObscure = true;
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
        obscureText: isObscure,
        validator: (value) {
          String? validationResult = widget.validator?.call(value);
          setState(() {
            hasError = validationResult != null;
          });
          return validationResult;
        },
        onChanged: widget.onChanged,
        controller: widget.controller,
        cursorColor: MyColors.kPrimaryColor,
        style: Theme.of(context).textTheme.titleSmall,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: Icon(
              isObscure ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                isObscure = !isObscure;
              });
            },
          ),
          hintStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .copyWith(color: Theme.of(context).colorScheme.primary),
          //  enabledBorder: outlineInputBorder,
          // focusedBorder: outlineInputBorder,
          errorBorder: outlineInputBorder.copyWith(
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
