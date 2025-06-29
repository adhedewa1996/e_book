import 'dart:math';

import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/extentions/string_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class Book {
  static Widget book({
    required BookEntity bookEntity,
    required BuildContext context,
    EdgeInsetsGeometry? margin, //
  }) {
    return GestureDetector(
      onTap: () {
        context.push('${Routes.detailBook}/${bookEntity.id}');
      },
      child: Container(
        width: Get.width * .45,
        margin: margin,
        decoration: BoxDecoration(
          color: AppColors.whiteMain,
          boxShadow: [
            BoxShadow(
              color: AppColors.greyNonActive,
              blurRadius: 5,
              offset: Offset(5, 5), //
            ),
          ],
          borderRadius: BorderRadius.circular(8), //
        ),
        child: Column(
          children: [
            Container(
              width: Get.width * .325,
              height: Get.width * .4,
              margin: margin,
              decoration: BoxDecoration(
                // color: AppColors.greenMain,
                borderRadius: BorderRadius.circular(8), //
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: AppImage.network(url: bookEntity.cover ?? ''),
              ),
            ),
            // Spacing.horizontal(16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: Get.width * .4,
                    child: Text(bookEntity.title ?? '', style: context.labelMedium, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                  Spacing.vertical(4),
                  SizedBox(
                    width: Get.width * .4,
                    child: Text(bookEntity.author ?? '', style: context.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                  Spacing.vertical(8),
                  readprogress(progress: Random().nextInt(100), width: Get.width * .45),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget smallbook({
    required BuildContext context,
    required BookEntity bookEntity,
    BookDetailType? bookDetailType = BookDetailType.star,
    EdgeInsetsGeometry? margin, //
    bool showDownloads = false,
  }) {
    return GestureDetector(
      onTap: () {
        context.push('${Routes.detailBook}/${bookEntity.id}');
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.whiteMain,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyNonActive,
                  blurRadius: 5,
                  offset: Offset(5, 5), //
                ),
              ],
              borderRadius: BorderRadius.circular(8), //
            ),
            padding: EdgeInsets.only(top: 16, left: 16, bottom: 16, right: 8),
            margin: EdgeInsets.only(right: 8),
            child: Row(
              children: [
                Container(
                  width: Get.width * .225,
                  height: Get.width * .3,
                  // margin: margin,
                  decoration: BoxDecoration(
                    // color: AppColors.greenMain,
                    borderRadius: BorderRadius.circular(8), //
                  ), //
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AppImage.network(url: bookEntity.cover ?? ''),
                  ),
                ),
                Spacing.horizontal(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .5,
                      child: Text(bookEntity.title ?? '', style: context.labelMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(4),
                    SizedBox(
                      width: Get.width * .5,
                      child: Text(bookEntity.author ?? '', style: context.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(8),
                    bookDetailType == BookDetailType.star ? iconstar(stars: Random().nextInt(5)) : readprogress(progress: Random().nextInt(100), width: Get.width * .35),
                  ],
                ),
              ],
            ),
          ),
          if (showDownloads)
            Align(
              alignment: Alignment.topRight,
              child: Transform.translate(
                offset: Offset(4, -16),
                child: OpacityAnimation(
                  duration: Duration(seconds: 3),
                  child: TranslateAnimation(
                    offset: -100,
                    duration: Duration(seconds: 4),
                    offsetDirection: Axis.horizontal,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                      decoration: BoxDecoration(
                        color: AppColors.darkMain,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12), //
                        ), //
                      ),
                      child: IntrinsicWidth(
                        child: Row(
                          children: [
                            Text(
                              (bookEntity.downloadCount ?? 0).countSimplify(),
                              style: context.labelMedium?.toWhite,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis, //
                            ),
                            Spacing.vertical(8),
                            Icon(Icons.sim_card_download_rounded, color: AppColors.greenMain),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  static Widget continueReading({
    required BookEntity bookEntity,
    required BuildContext context,
    BookDetailType? bookDetailType = BookDetailType.star,
    EdgeInsetsGeometry? margin, //
  }) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.readingMode);
        // sl<RecentlyReadServices>().put(book);
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.whiteMain,
          borderRadius: BorderRadius.circular(8), //
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: Get.width * .175,
                  height: Get.width * .25,
                  // margin: margin,
                  decoration: BoxDecoration(
                    // color: AppColors.greenMain,
                    borderRadius: BorderRadius.circular(8), //
                  ), //
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AppImage.network(url: bookEntity.cover ?? ''),
                  ),
                ),
                Spacing.horizontal(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: Get.width * .45,
                      child: Text(bookEntity.title ?? '', style: context.labelMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(4),
                    SizedBox(
                      width: Get.width * .45,
                      child: Text(bookEntity.author ?? '', style: context.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(16),
                    readprogress(progress: Random().nextInt(100), width: Get.width * .45),
                    Spacing.vertical(16),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget topbook({
    required BookEntity bookEntity,
    required BuildContext context, //
  }) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Top E-Book Reading', style: context.titleLarge),
          Spacing.vertical(16),
          Text('This top E-Book for you. we have many type for you needed.', style: context.labelLarge),
          Spacing.vertical(16),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: Get.width * .35,
                    height: Get.width * .5,
                    decoration: BoxDecoration(
                      color: AppColors.darkMain,
                      borderRadius: BorderRadiusGeometry.circular(12), //
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(8),
                      child: AppImage.network(
                        url: bookEntity.cover ?? '', //
                        width: Get.width * .35 - 8,
                        height: Get.width * .5 - 8,
                      ), //
                    ),
                  ),
                ],
              ),
              Spacing.horizontal(16),
              SizedBox(
                width: Get.width * .45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(bookEntity.title ?? '', style: context.labelMedium, maxLines: 2, overflow: TextOverflow.ellipsis),
                    Spacing.vertical(16),
                    Text(bookEntity.author ?? '', style: context.titleSmall, maxLines: 2, overflow: TextOverflow.ellipsis), //
                    Spacing.vertical(16),
                    iconstar(stars: [4, 5][Random().nextInt(2)]),
                    Spacing.vertical(16),
                    Text('${(bookEntity.downloadCount ?? 0).countSimplify()} Downloads', style: context.labelMedium, maxLines: 3, overflow: TextOverflow.ellipsis),
                    Spacing.vertical(16),
                    AppButton.primary(
                      onPressed: () {
                        context.push('${Routes.detailBook}/${bookEntity.id}');
                      },
                      title: 'DETAIL BOOK',
                      context: context,
                    ),
                  ],
                ),
              ),
            ],
          ),
          //
        ],
      ),
    );
  }

  static Widget readprogress({int? progress, required double width}) {
    return Container(
      width: width,
      height: 6,
      decoration: BoxDecoration(
        color: AppColors.greyNonActive,
        borderRadius: BorderRadius.circular(8), //
      ),
      child: Stack(
        children: [
          Container(
            width: width * ((progress ?? 0) / 100),
            height: 10,
            decoration: BoxDecoration(
              color: AppColors.darkMain,
              borderRadius: BorderRadius.circular(8), //
            ),
          ),
        ],
      ),
    );
  }

  static Widget iconstar({int? stars}) {
    return SizedBox(
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              for (int i = 0; i < 5; i++) Icon(Icons.star, color: AppColors.greyNonActive, size: 20), //
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              for (int i = 0; i < (stars ?? 0); i++) Icon(Icons.star, color: AppColors.greenMain, size: 20), //
            ],
          ),
        ],
      ),
    );
  }
}
