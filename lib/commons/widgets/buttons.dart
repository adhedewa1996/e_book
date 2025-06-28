import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton {
  static Widget common({
    required Function() onPressed,
    required String title,
    required BuildContext context,
    double? height,
    double? width,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greyBackground,
        surfaceTintColor: AppColors.whiteMain,
        foregroundColor: AppColors.whiteMain,
        minimumSize: Size(width ?? 80, height ?? 80),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: AppColors.greyTeritary),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(title, style: context.labelLarge),
      ),
    );
  }

  static Widget primary({
    required Function() onPressed,
    bool isdisable = false,
    required String title,
    String? icon,
    required BuildContext context,
    double? height,
    double? width, //
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isdisable
            ? AppColors.greyBackground
            : AppColors.blueMain,
        surfaceTintColor: isdisable
            ? AppColors.greyNonActive
            : AppColors.blueMain,
        foregroundColor: isdisable
            ? AppColors.greyNonActive
            : AppColors.blueMain,
        minimumSize: Size(width ?? 80, height ?? 40),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // if (icon != null)
            //   Row(
            //     children: [
            //       AppImage.svg(name: icon, width: 9, height: 9),
            //       Spacing.horizontal(8),
            //     ],
            //   ),
            Text(
              title,
              style: context.labelLarge?.copyWith(
                color: isdisable ? AppColors.blueMain : AppColors.whiteMain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
