import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ShadowBox {
  static List<BoxShadow> normal({
    Color? color, //
  }) {
    return [
      BoxShadow(
        color: color ?? AppColors.greyNonActive,
        blurRadius: 5,
        offset: Offset(5, 5), //
      ),
    ];
  }
}
