import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/shimmers.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/state_check.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/presentation/search/getx/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSearchBook extends GetView<SearchBookController> {
  const ListSearchBook({
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
      child: Column(
        children: [header, Spacing.vertical(16), books()], //
      ), //
    );
  }

  Widget books() {
    return controller.obx(
      (state) {
        final data = controller.listBooks;
        return Container(
          width: Get.width,
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListView.separated(
                padding: EdgeInsets.only(top: 24),
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final item = data[index];
                  return TranslateAnimation(
                    duration: Duration(milliseconds: 1000 + (index * 10)),
                    offsetDirection: Axis.horizontal,
                    offset: Get.width * .4,
                    child: RepaintBoundary(
                      child: Book.smallbook(
                        bookEntity: item,
                        context: context,
                        bookDetailType: bookDetailType,
                        showDownloads: true,
                        margin: EdgeInsets.only(bottom: 16), //
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Spacing.vertical(28);
                },
              ),
              Obx(() {
                if (controller.isNoMore.value) return StateCheck.noLoadMore();
                if (controller.isLoadmore.value) {
                  return Column(
                    children: [
                      Spacing.vertical(16), //
                      AppShimmers.image(height: Get.height * .15, width: Get.width),
                      Spacing.vertical(16), //
                      AppShimmers.image(height: Get.height * .15, width: Get.width),
                      Spacing.vertical(16), //
                    ],
                  );
                }
                return SizedBox();
              }),
            ],
          ),
        );
      },
      onLoading: ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(16),
        children: [
          AppShimmers.image(height: Get.height * .15, width: Get.width),
          Spacing.vertical(16),
          AppShimmers.image(height: Get.height * .15, width: Get.width),
          Spacing.vertical(16),
          Spacing.vertical(16),
          AppShimmers.image(height: Get.height * .15, width: Get.width),
          Spacing.vertical(16),
          AppShimmers.image(height: Get.height * .15, width: Get.width),
          Spacing.vertical(16),
          AppShimmers.image(height: Get.height * .15, width: Get.width), //
        ],
      ),
      onError: (error) => SizedBox(
        width: Get.width,
        height: Get.height,
        child: StateCheck.error(error: error), //
      ),
      onEmpty: StateCheck.empty(),
    );
  }
}
