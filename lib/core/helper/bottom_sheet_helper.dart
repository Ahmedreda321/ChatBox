import 'package:flutter/material.dart';

void showBottomhelperSheet(BuildContext parentContext, Widget child) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: parentContext,
    builder: (context) {
      return child;
    },
  );
}
