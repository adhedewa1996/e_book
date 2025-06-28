import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmers {
  static Widget image({double? height, double? width, Color color = Colors.white}) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: AppColors.blueSeconday.withValues(alpha: 0.2),
      highlightColor: color,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.greyBackground,
          borderRadius: BorderRadius.circular(8), //
        ),
      ),
    );
  }
}
