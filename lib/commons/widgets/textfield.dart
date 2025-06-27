import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({super.key, required this.context, required this.hint, required this.controller, this.suffixIcon});

  final BuildContext context;
  final String hint;
  final Widget? suffixIcon;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Spacing.vertical(8),
        Container(
          height: 45,
          decoration: BoxDecoration(color: AppColors.whiteMain, borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            cursorHeight: 0,
            focusNode: FocusNode(),
            controller: controller,
            decoration: InputDecoration(
              hint: Text(hint),
              suffixIcon: GestureDetector(
                onTap: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Container(
                  width: 40,
                  height: 45,
                  padding: EdgeInsets.zero,
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: AppColors.greyBackground,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: AppColors.greyTeritary),
                  ),
                ),
              ),
              suffixIconConstraints: BoxConstraints(maxWidth: 100, minWidth: 45),
            ).applyDefaults(Theme.of(context).inputDecorationTheme),
            // validator: (value) {
            //   if (isRequired) {
            //     if (value == null || value.isEmpty) {
            //       return 'Kolom ini Wajib diisi';
            //     }
            //   }

            //   return null;
            // },
            // style: context.labelLarge,
            // decoration: InputDecoration().applyDefaults(Theme.of(context).inputDecorationTheme),
          ),
        ),
        // if (useBottomPadding ?? false) Spacing.vertical(10),
        // if (description != null) Text(description ?? '', style: context.labelMedium?.toSecondary),
      ],
    );
  }
}
