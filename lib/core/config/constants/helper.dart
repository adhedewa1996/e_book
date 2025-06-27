import 'dart:math';
import 'dart:ui';

import 'package:e_books/core/config/assets/app_vectors.dart';
import 'package:e_books/core/config/theme/app_colors.dart';

class Helper {
  static String randomHorizontalImage() {
    return [AppVectors.waveBig1, AppVectors.waveBig2][Random().nextInt(2)]; //
  }

  static String randomVerticalImage() {
    return [
      AppVectors.waveSmall1, AppVectors.waveSmall2, AppVectors.waveSmall3, AppVectors.waveSmall4, //
    ][Random().nextInt(4)]; //
  }

  static Color randomColor() {
    final List<Color> color = [
      AppColors.blueInfo, AppColors.blueMain, AppColors.redDanger, AppColors.greenMain, AppColors.greenSecondary, //
    ];
    return color[Random().nextInt(color.length - 1)];
  }

  static String randomQuote() {
    List<String> quotes = [
      "The more that you read, the more things you will know. The more that you learn, the more places you'll go. \n\n~ Dr. Seuss",
      "A reader lives a thousand lives before he dies. The man who never reads lives only one. \n\n~ George R.R. Martin",
      "Reading is to the mind what exercise is to the body. \n\n~ Joseph Addison",
      "Books are a uniquely portable magic. \n\n~ Stephen King",
      "To learn to read is to light a fire; every syllable that is spelled out is a spark. \n\n~ Victor Hugo",
      "You don't have to burn books to destroy a culture. Just get people to stop reading them. \n\n~ Ray Bradbury",
      "Show me a family of readers, and I will show you the people who move the world. \n\n~ Napoleon Bonaparte",
      "A book is a device to ignite the imagination. \n\n~ Alan Bennett",
      "Reading gives us someplace to go when we have to stay where we are. \n\n~ Mason Cooley",
    ];
    return quotes[Random().nextInt(quotes.length - 1)];
  }
}
