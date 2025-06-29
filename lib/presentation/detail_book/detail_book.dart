import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/extentions/string_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/shimmers.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/state_check.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/data/sources/recently_read.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/presentation/detail_book/getx/detail_book_controller.dart';
import 'package:e_books/presentation/favorites/hive/bookmark_favorite.dart';
import 'package:e_books/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class DetailBook extends GetView<DetailBooksController> {
  const DetailBook({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailBooksController>(
      builder: (controller) {
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
              child: Stack(
                children: [
                  Container(
                    width: Get.width,
                    height: Get.height,
                    color: Colors.white,
                    child: detailBook(context), //
                  ),
                  Positioned(
                    top: 48,
                    left: 32,
                    child: Container(
                      width: 56,
                      height: 56,
                      margin: const EdgeInsets.only(right: 12, bottom: 32),
                      decoration: BoxDecoration(
                        color: AppColors.whiteMain,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.greyNonActive,
                            blurRadius: 2,
                            offset: Offset(2, 2), //
                          ),
                        ],
                        borderRadius: BorderRadius.circular(64), //
                      ),
                      child: IconButton(
                        onPressed: () {
                          context.pop();
                          Get.delete<DetailBooksController>();
                        },
                        icon: Icon(
                          Icons.close_rounded,
                          size: 28, //
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: controller.status.isSuccess ? bottomNav(context, controller.book) : null,
          ),
        );
      },
    );
  }

  Widget detailBook(BuildContext context) {
    return controller.obx(
      (state) {
        final book = state as BookEntity;
        return ListView(
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height, //
                  color: AppColors.darkMain,
                ),
                AppImage.randomImageCover(context: context),
                Container(
                  width: Get.width,
                  height: Get.height, //
                  color: AppColors.darkMain.withValues(alpha: 0.75),
                ),
                Column(
                  children: [
                    cover(context, book),
                    summaries(context, book), //
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
        ],
      ),
      onError: (error) => SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Center(child: StateCheck.error(mainAxisAlignment: MainAxisAlignment.center)), //
        ),
      ),
      onEmpty: SizedBox(
        width: Get.width,
        height: Get.height,
        child: Center(
          child: Center(child: StateCheck.empty(mainAxisAlignment: MainAxisAlignment.center)), //
        ),
      ),
    );
  }

  Widget bottomNav(BuildContext context, BookEntity? book) {
    return TranslateAnimation(
      offset: (Get.height * .1),
      duration: const Duration(seconds: 3),
      child: Container(
        color: Colors.transparent,
        child: Row(
          children: [
            iconFavorite(item: book!),
            Flexible(
              child: Container(
                height: 60,
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                margin: const EdgeInsets.only(right: 18, bottom: 32),
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
                        onPressed: () {
                          try {
                            context.push(Routes.readingMode);
                            sl<RecentlyReadServices>().put(book);
                          } catch (e) {
                            print('error $e');
                          }
                        },
                        title: 'START READING',
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
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                width: Get.width * .8,
                child: Column(
                  children: [
                    Spacing.vertical(60),
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          bookEntity.title ?? '',
                          textStyle: context.labelMedium?.copyWith(height: 2).toWhite, //
                          textAlign: TextAlign.center,
                        ), //
                      ],
                    ),
                    Spacing.vertical(12),
                    AnimatedTextKit(
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(
                          bookEntity.author ?? '',
                          textStyle: context.titleSmall?.toWhite, //
                          textAlign: TextAlign.center,
                        ), //
                      ],
                    ),
                    Spacing.vertical(16),
                  ],
                ),
              ),
              Spacing.vertical(8),
              TranslateAnimation(
                duration: Duration(seconds: 2),
                offset: 100,
                child: OpacityAnimation(
                  duration: Duration(seconds: 2),
                  child: Container(
                    width: Get.width * .35,
                    height: Get.width * .5,
                    decoration: BoxDecoration(
                      color: AppColors.whiteMain, //
                      borderRadius: BorderRadius.circular(8), //
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: AppImage.network(url: bookEntity.cover ?? ''),
                    ),
                  ),
                ),
              ),
              Spacing.vertical(32),
              TranslateAnimation(
                duration: Duration(seconds: 2),
                offset: Get.height * .5,
                child: OpacityAnimation(
                  duration: Duration(seconds: 2),
                  child: ReadProgress(
                    progress: Random().nextInt(100),
                    width: Get.width * .6, //
                    color: AppColors.greenMain,
                    backgroundColor: AppColors.whiteMain,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget summaries(BuildContext context, BookEntity bookEntity) {
    return TranslateAnimation(
      duration: Duration(seconds: 2),
      offset: Get.height * .3,
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
          color: AppColors.whiteMain, //
          borderRadius: BorderRadius.circular(16),
        ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                box(
                  color: AppColors.greyNonActive.withValues(alpha: 0.3),
                  child: Row(
                    children: [
                      Icon(Icons.star_rounded, color: AppColors.greenMain, size: 16),
                      Text('4', style: context.labelMedium?.toBlack), //
                    ],
                  ),
                ),
                box(
                  color: AppColors.blueInfo.withValues(alpha: 0.1),
                  child: Text('Fantasy', style: context.labelMedium?.toBlack), //
                ),
                box(
                  color: AppColors.greenMain.withValues(alpha: 0.1),
                  child: Text('${(bookEntity.downloadCount ?? 0).countSimplify()} Downloads', style: context.labelMedium?.toBlack), //
                ),
              ],
            ),
            Spacing.vertical(16),
            Text('Summaries', style: context.titleMedium),
            Spacing.vertical(16),
            AnimatedTextKit(
              isRepeatingAnimation: false,
              animatedTexts: [
                TyperAnimatedText(
                  bookEntity.summary ?? '',
                  textStyle: context.labelMedium?.copyWith(height: 2),
                  textAlign: TextAlign.justify, //
                  speed: const Duration(milliseconds: 4),
                ), //
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget infocard(BuildContext context, BookEntity bookEntity) {
    return Container(
      height: 60,
      margin: const EdgeInsets.symmetric(horizontal: 32),
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
              title: 'LISTEN AUDIO BOOK',
              context: context, //
              icon: Icon(Icons.audiotrack_rounded, color: AppColors.whiteMain),
            ),
          ),
          Spacing.horizontal(8),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.symmetric(horizontal: 32),
    //   child: AppButton.primary(
    //     onPressed: () {},
    //     title: 'LISTEN AUDIO BOOK',
    //     context: context, //
    //     icon: Icon(Icons.audiotrack_rounded, color: AppColors.whiteMain),
    //     color: AppColors.greenMain,
    //   ),
    // );
  }

  Widget box({Color? color, required Widget child}) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(8)),
      child: child,
    );
  }
}
