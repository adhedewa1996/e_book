import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension SizeHelper on BuildContext {
  double get width {
    return MediaQuery.of(this).size.width;
  }

  double get height {
    return MediaQuery.of(this).size.height;
  }

  TextStyle? get titleLarge => theme.textTheme.titleLarge;
  TextStyle? get titleMedium => theme.textTheme.titleMedium;
  TextStyle? get titleSmall => theme.textTheme.titleSmall;
  TextStyle? get bodyLarge => theme.textTheme.bodyLarge;
  TextStyle? get bodyMedium => theme.textTheme.bodyMedium;
  TextStyle? get labelLarge => theme.textTheme.labelLarge;
  TextStyle? get labelMedium => theme.textTheme.labelMedium;
  TextStyle? get labelSmall => theme.textTheme.labelSmall;
}

extension TextStyleHelper on TextStyle {
  TextStyle? get toBold => copyWith(fontWeight: FontWeight.bold);
  TextStyle? get toBlack => copyWith(color: Colors.black);
  TextStyle? get toWhite => copyWith(color: AppColors.whiteMain);
  TextStyle? get toSecondary => copyWith(color: AppColors.textBlackSecondary);
}
