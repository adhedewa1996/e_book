import 'dart:math';

import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/shimmers.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/state_check.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopBook extends GetView<HomeController> {
  const TopBook({super.key});

  @override
  Widget build(BuildContext context) {
    return books(context);
  }

  Widget books(BuildContext context) {
    return controller.obx(
      (state) {
        final book = controller.listBooks[Random().nextInt(controller.listBooks.length - 1)];
        return TranslateAnimation(
          duration: Duration(seconds: 2),
          offset: Get.height * .3,
          child: SizedBox(
            width: Get.width,
            child: Book.topbook(bookEntity: book, context: context),
          ),
        );
      },
      onLoading: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            AppShimmers.image(height: Get.height * .15, width: Get.width),
            Spacing.vertical(16),
            AppShimmers.image(height: Get.height * .15, width: Get.width),
            Spacing.vertical(16),
            AppShimmers.image(height: Get.height * .15, width: Get.width), //
          ],
        ),
      ),
      onError: (error) => Center(child: StateCheck.error(error: error)),
      onEmpty: StateCheck.empty(),
    );
  }
}
