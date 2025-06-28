import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/textfield.dart';
import 'package:e_books/core/config/assets/app_images.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/presentation/home/getx/books/continue_reading.dart';
import 'package:e_books/presentation/home/getx/books/list_book.dart';
import 'package:e_books/presentation/home/getx/books/slider_book.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:e_books/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Home extends StatelessWidget {
  const Home({
    super.key, //
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      global: true,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            title: FlexibleSpaceBar(title: header(context)),
            actions: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(100),
                child: AppImage.assets(
                  name: AppImages.userProfile,
                  width: 60,
                  height: 60, //
                ),
              ),
              Spacing.horizontal(16),
            ],
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              controller.onRefresh();
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if ((controller.scrollController?.position.pixels ?? 0) > ((controller.scrollController?.position.maxScrollExtent ?? 0) * .98)) {
                  Get.find<HomeController>().handleLoadmore();
                }
                return false;
              },
              child: Container(
                width: Get.width,
                height: Get.height,
                padding: EdgeInsets.symmetric(horizontal: 16),
                color: AppColors.whiteMain,
                child: ListView(
                  controller: controller.scrollController,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    GestureDetector(
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
                    Spacing.vertical(16),
                    ContinueReading(),
                    Spacing.vertical(32),
                    SliderBook(),
                    Spacing.vertical(32),
                    ListBook(
                      bookDetailType: BookDetailType.star,
                      header: Text('Best Sellers', style: context.bodyLarge),
                    ),
                  ], //
                ),
              ),
            ),
          ),
        );
      },
    );
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
