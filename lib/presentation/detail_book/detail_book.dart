import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/shimmers.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/presentation/detail_book/getx/detail_book_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DetailBook extends GetView<DetailBooksController> {
  const DetailBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        appBar: null,
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        extendBody: true,
        body: PopScope(
          canPop: true,
          onPopInvokedWithResult: (didPop, result) {
            Get.delete<DetailBooksController>();
          },
          child: Container(
            width: Get.width,
            height: Get.height,
            color: Colors.white,
            child: detailBook(context), //
          ),
        ),
        bottomNavigationBar: bottomNav(context),
      ),
    );
  }

  Widget detailBook(BuildContext context) {
    return controller.obx(
      (state) {
        final book = state as BookEntity;
        return ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                AppImage.randomImageCover(context),
                Container(
                  width: Get.width,
                  height: Get.height, //
                  color: AppColors.greyBackground.withValues(alpha: 0.6),
                ),
                Container(
                  width: Get.width,
                  height: Get.height, //
                  color: Colors.black.withValues(alpha: 0.1),
                ),
                Column(
                  children: [
                    cover(context, book), summaries(context, book), //
                  ],
                ),
              ],
            ),
          ],
        );
      },
      onLoading: Column(
        children: [
          Spacing.vertical(16),
          AppShimmers.image(height: Get.height * .4, width: Get.width),
          Spacing.vertical(16),
          AppShimmers.image(height: 60, width: Get.width - 32),
          Spacing.vertical(16),
          AppShimmers.image(height: Get.width - 32, width: Get.width - 32),
          // Transform.translate(
          //   offset: Offset(32, (Get.height * .1)),
          //   child: AppShimmers.image(
          //     height: 32,
          //     width: 32,
          //     color: AppColors.blueSeconday,
          //     //
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(32, (Get.height * .465)),
          //   child: AppShimmers.image(
          //     height: 60,
          //     width: Get.width - 64,
          //     color: AppColors.blueSeconday,
          //     //
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(Get.width / 4, (Get.height * .125)),
          //   child: AppShimmers.image(
          //     height: Get.height * .3,
          //     width: Get.width / 2,
          //     color: AppColors.blueSeconday,
          //     //
          //   ),
          // ),
          // Transform.translate(
          //   offset: Offset(32, (Get.height * .575)),
          //   child: AppShimmers.image(
          //     height: Get.height * .3,
          //     width: Get.width - 64,
          //     color: AppColors.blueSeconday,
          //     //
          //   ),
          // ),
        ],
      ),
      onError: (error) => Text('INI ERROR $error'),
      onEmpty: Text('INI EMPTY'),
    );
  }

  Widget bottomNav(BuildContext context) {
    return TranslateAnimation(
      offset: (Get.height * .1),
      duration: const Duration(seconds: 1),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              margin: const EdgeInsets.only(left: 32, bottom: 32, right: 12),
              decoration: BoxDecoration(
                color: AppColors.whiteMain,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyNonActive,
                    blurRadius: 5,
                    offset: Offset(5, 5), //
                  ),
                ],
                borderRadius: BorderRadius.circular(64), //
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite_outline,
                  color: AppColors.redDanger, //
                  size: 24, //
                ),
              ),
            ),
            Container(
              width: 60,
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
              margin: const EdgeInsets.only(right: 12, bottom: 32),
              decoration: BoxDecoration(
                color: AppColors.whiteMain,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.greyNonActive,
                    blurRadius: 5,
                    offset: Offset(5, 5), //
                  ),
                ],
                borderRadius: BorderRadius.circular(64), //
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.play_circle_filled_rounded,
                  color: AppColors.greenMain,
                  size: 28, //
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                margin: const EdgeInsets.only(right: 32, bottom: 32),
                decoration: BoxDecoration(
                  color: AppColors.whiteMain,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyNonActive,
                      blurRadius: 5,
                      offset: Offset(5, 5), //
                    ),
                  ],
                  borderRadius: BorderRadius.circular(64), //
                ),
                child: Row(
                  children: [
                    Spacing.horizontal(8),
                    Expanded(
                      child: AppButton.primary(
                        onPressed: () {},
                        title: 'Start Reading!',
                        context: context, //
                      ),
                    ),
                    Spacing.horizontal(8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cover(BuildContext context, BookEntity bookEntity) {
    return Container(
      width: Get.width,
      // height: Get.width * 1.175,
      padding: EdgeInsets.symmetric(vertical: Get.height * .085),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              context.pop();
              Get.delete<DetailBooksController>();
            },
            icon: Icon(Icons.arrow_back_ios_rounded), //
          ),
          Column(
            children: [
              SizedBox(
                width: Get.width * .7,
                child: Column(
                  children: [
                    Text(bookEntity.title ?? '', style: context.titleMedium, textAlign: TextAlign.center),
                    Spacing.vertical(12),
                    Text(bookEntity.author ?? '', style: context.bodyLarge, textAlign: TextAlign.center),
                    Spacing.vertical(16),
                  ],
                ),
              ),
              Container(
                width: Get.width * .4,
                height: Get.width * .6,
                decoration: BoxDecoration(
                  color: AppColors.whiteMain, //
                  borderRadius: BorderRadius.circular(8), //
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: AppImage.network(url: bookEntity.cover ?? ''),
                ),
              ),
            ],
          ),
          SizedBox(width: Get.width * .125),
        ],
      ),
    );
  }

  Widget summaries(BuildContext context, BookEntity bookEntity) {
    return Container(
      width: Get.width,
      color: AppColors.whiteMain, //
      padding: EdgeInsets.only(
        // top: Get.height * .08,
        right: 32,
        left: 32,
        bottom: Get.height * .2, //
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(0, -30),
            child: infocard(
              context,
              bookEntity, //
            ),
          ),
          Text('Summaries', style: context.titleMedium),
          Spacing.vertical(16),
          Text(
            bookEntity.summary ?? '',
            style: context.labelLarge?.copyWith(height: 2),
            textAlign: TextAlign.justify, //
          ),
        ],
      ),
    );
  }

  Widget infocard(BuildContext context, BookEntity bookEntity) {
    return Container(
      width: Get.width,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.whiteMain,
        boxShadow: [
          BoxShadow(
            color: AppColors.greyNonActive,
            blurRadius: 0.25,
            offset: Offset(0.25, 0.25), //
          ),
        ],
        borderRadius: BorderRadius.circular(12),
        //
      ), //
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          box(
            color: AppColors.greyNonActive.withValues(alpha: 0.3),
            child: Row(
              children: [
                Icon(Icons.star_rounded, color: AppColors.greenMain, size: 16),
                Text('4', style: context.labelLarge?.toBlack), //
              ],
            ),
          ),
          box(
            color: AppColors.blueInfo.withValues(alpha: 0.1),
            child: Text('Fantasy', style: context.labelLarge?.toBlack), //
          ),
          box(
            color: AppColors.greenMain.withValues(alpha: 0.1),
            child: Text('${bookEntity.downloadCount ?? 0} Downloads', style: context.labelLarge?.toBlack), //
          ),
        ],
      ),
    );
  }

  Widget box({Color? color, required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(16)),
      child: child,
    );
  }
}
