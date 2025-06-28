import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/shimmers.dart';
import 'package:e_books/commons/widgets/state_check.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinueReading extends GetView<HomeController> {
  const ContinueReading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text('Continue Reading', style: context.bodyLarge),
          ),
          firstbook(context),
        ],
      ), //
    );
  }

  Widget firstbook(BuildContext context) {
    return controller.obx(
      (state) {
        final data = controller.listBooks;
        final book = data[data.length - 2]; // take second last as sample
        return Book.continueReading(
          bookEntity: book,
          context: context,
          margin: EdgeInsets.only(
            bottom: 16,
            top: 16, //
          ),
        );
      },
      onLoading: AppShimmers.image(height: Get.height * .2, width: Get.width),
      onError: (error) => StateCheck.error(error: error),
      onEmpty: SizedBox(
        width: Get.width,
        child: StateCheck.empty(), //
      ),
    );
  }
}
