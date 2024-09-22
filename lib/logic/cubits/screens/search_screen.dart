import 'package:chatbox/features/auth/widgets/input_field_widget.dart';
import 'package:chatbox/features/auth/widgets/my_icon_svg.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/core/utils/svgs.dart';
import 'package:chatbox/features/auth/widgets/pages_body.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});
  static String id = 'SearchScreen';
  @override
  Widget build(BuildContext context) {
    return PagesBody(
      showBackIcon: true,
      body: [
        InputFieldWidget(
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          autofocus: true,
          suffixIcon: const Padding(
            padding: EdgeInsets.all(8.0),
            child: MyIconSvg(value: 2, svgIcon: Assets.svgsSearch),
          ),
          hintText: 'Search',
        ),
        const VSpace(value: 69)
      ],
    );
  }
}
