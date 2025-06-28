import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.context,
    required this.hint,
    required this.controller,
    this.callback,
    this.enabled = true,
    this.suffixIcon, //
  });

  final BuildContext context;
  final String hint;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool enabled;
  final Function(String)? callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.vertical(8),
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.whiteMain,
            borderRadius: BorderRadius.circular(10), //
          ),
          child: TextFormField(
            controller: controller,
            enabled: enabled, // disable when false
            decoration: InputDecoration(
              hintText: 'Search...',
              hintStyle: context.labelMedium,
              prefixIcon: Icon(Icons.search),
              filled: true,
              fillColor: Colors.white, //
            ),
            onFieldSubmitted: (value) {
              callback?.call(value);
            },
          ),
        ),
      ],
    );
  }
}
