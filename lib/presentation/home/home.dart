import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/textfield.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/presentation/home/hive/continue_reading.dart';
import 'package:e_books/presentation/home/getx/books/list_book.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:e_books/presentation/home/getx/books/top_book.dart';
import 'package:e_books/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Home extends GetView<HomeController> {
  const Home({
    super.key, //
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: RefreshIndicator(
          onRefresh: () async {
            controller.onRefresh();
          },
          child: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification notification) {
              if ((controller.scrollController.value.position.pixels) > ((controller.scrollController.value.position.maxScrollExtent) * .98)) {
                Get.find<HomeController>().handleLoadmore();
              }
              return false;
            },
            child: Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(horizontal: 8),
              color: AppColors.whiteMain,
              child: ListView(
                controller: controller.scrollController.value,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GestureDetector(
                      onTap: () {
                        context.push(Routes.search);
                      },
                      child: AppTextField(
                        context: context,
                        hint: 'Search',
                        enabled: false,
                        controller: TextEditingController(), //
                      ),
                    ),
                  ),
                  Spacing.vertical(8),
                  TopBook(),
                  Spacing.vertical(8),
                  RepaintBoundary(child: ContinueReading()),
                  Spacing.vertical(32),
                  ListBook(
                    bookDetailType: BookDetailType.star,
                    header: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Recommended Books', style: context.bodyLarge), Spacing.vertical(8),
                        RepaintBoundary(child: Book.recommendedBook(context)), //
                      ],
                    ),
                  ),
                ], //
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget header(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome, Dogus Ünsalan', style: context.labelMedium),
          Spacing.vertical(4),
          SizedBox(
            width: Get.width * .7,
            child: Text(
              'What would you like to read today?',
              style: context.bodyLarge, //
            ),
          ),
          Spacing.vertical(8),
          //
        ],
      ), //
    );
  }
}
