import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/assets/app_vectors.dart';
import 'package:flutter/widgets.dart';

class StateCheck {
  static Widget noLoadMore() {
    return Column(
      children: [
        Spacing.vertical(64), //
        AppImage.svg(name: AppVectors.iconLeave, width: 32),
        Spacing.vertical(16), //
        Text('No More Books To Show'),
        Spacing.vertical(64), //
      ],
    );
  }

  static Widget empty({MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Spacing.vertical(64), //
        AppImage.svg(name: AppVectors.iconQuestion, width: 32),
        Spacing.vertical(16), //
        Text('Nothing to Show'),
        Spacing.vertical(64), //
      ],
    );
  }

  static Widget error({String? error, MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start}) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Spacing.vertical(64), //
        AppImage.svg(name: AppVectors.iconCancel, width: 32),
        Spacing.vertical(16), //
        Text('Some Error Occure!\n $error'),
        Spacing.vertical(64), //
      ],
    );
  }
}
