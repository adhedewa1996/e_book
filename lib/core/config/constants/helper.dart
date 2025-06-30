import 'dart:math';
import 'dart:ui';

import 'package:e_books/core/config/assets/app_vectors.dart';
import 'package:e_books/core/config/constants/dummy_data.dart';
import 'package:e_books/core/config/theme/app_colors.dart';

class Helper {
  static String randomHorizontalImage() {
    return [AppVectors.waveBig1, AppVectors.waveBig2][Random().nextInt(2)]; //
  }

  static String randomVerticalImage() {
    return [
      AppVectors.waveSmall1,
      AppVectors.waveSmall2,
      AppVectors.waveSmall3,
      AppVectors.waveSmall4, //
    ][Random().nextInt(4)]; //
  }

  static Color randomColor() {
    final List<Color> color = [
      AppColors.blueInfo,
      AppColors.darkMain,
      AppColors.redDanger,
      AppColors.greenMain,
      AppColors.greenSecondary, //
    ];
    return color[Random().nextInt(color.length - 1)];
  }

  static String randomQuote() {
    List<String> quotes = DummyData.quotes;
    return quotes[Random().nextInt(quotes.length - 1)];
  }
}
