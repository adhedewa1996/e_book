import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/shimmers.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/state_check.dart';
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
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header, Spacing.vertical(16), books(), //
        ],
      ), //
    );
  }

  Widget books() {
    return controller.obx(
      (state) {
        final data = controller.listBooks;
        return SizedBox(
          width: Get.width,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return TranslateAnimation(
                    duration: Duration(milliseconds: 1000 + (index * 10)),
                    offsetDirection: Axis.horizontal,
                    offset: Get.width * .4,
                    child: Book.smallbook(
                      bookEntity: item,
                      context: context,
                      bookDetailType: bookDetailType,
                      showDownloads: true,
                      margin: EdgeInsets.only(bottom: 16), //
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Spacing.vertical(28);
                },
              ),
              //
              if (controller.isNoMore.value) StateCheck.noLoadMore(),
              if (controller.isLoadmore.value)
                Column(
                  children: [
                    Spacing.vertical(16), //
                    AppShimmers.image(height: Get.height * .15, width: Get.width),
                    Spacing.vertical(16), //
                    AppShimmers.image(height: Get.height * .15, width: Get.width),
                    Spacing.vertical(16), //
                  ],
                ),
            ],
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
      onError: (error) => Column(
        children: [
          Center(child: StateCheck.error(error: error)),
          Spacing.vertical(Get.height * .2),
        ],
      ),
      onEmpty: StateCheck.empty(),
    );
  }
}
