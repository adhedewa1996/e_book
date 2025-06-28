import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/shimmers.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListBook extends GetView<HomeController> {
  const ListBook({
    super.key, //
    required this.header,
    this.bookDetailType,
  });

  final Widget header;
  final BookDetailType? bookDetailType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(children: [header, Spacing.vertical(16), books()]), //
    );
  }

  Widget books() {
    return controller.obx(
      (state) {
        final data = controller.listBooks;
        return SizedBox(
          width: Get.width,
          child: ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              final item = data[index];
              return Book.smallbook(
                bookEntity: item,
                context: context,
                bookDetailType: bookDetailType,
                margin: EdgeInsets.only(bottom: 16), //
              );
            },
            separatorBuilder: (context, index) {
              return Spacing.vertical(16);
            },
          ),
        );
      },
      onLoading: Column(
        children: [
          AppShimmers.image(height: Get.height * .15, width: Get.width),
          Spacing.vertical(16),
          AppShimmers.image(height: Get.height * .15, width: Get.width),
          Spacing.vertical(16),
          AppShimmers.image(height: Get.height * .15, width: Get.width), //
        ],
      ),
      onError: (error) => Text('INI ERROR $error'),
      onEmpty: Text('INI EMPTY'),
    );
  }
}
