import 'dart:math';

import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum BookDetailType { star, progress }

class Book {
  static Widget book({
    required BuildContext context,
    EdgeInsetsGeometry? margin, //
  }) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.detailBook);
      },
      child: Container(
        width: context.width * .45,
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
              width: context.width * .325,
              height: context.width * .4,
              margin: margin,
              decoration: BoxDecoration(
                color: AppColors.greenMain,
                borderRadius: BorderRadius.circular(8), //
              ),
            ),
            // Spacing.horizontal(16),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: context.width * .4,
                    child: Text('TitleTit leTitleTi tleTitle TitleTitle tleTitle TitleTi tleTitle TitleTi', style: context.labelLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                  Spacing.vertical(4),
                  SizedBox(
                    width: context.width * .4,
                    child: Text('TitleTit leTitleTi tleTitle TitleTitle tleTitle TitleTi tleTitle TitleTi', style: context.labelLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
                  ),
                  Spacing.vertical(8),
                  readprogress(progress: Random().nextInt(100), width: context.width * .45),
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
    BookDetailType? bookDetailType = BookDetailType.star,
    EdgeInsetsGeometry? margin, //
  }) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.detailBook);
      },
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: context.width * .225,
                  height: context.width * .3,
                  // margin: margin,
                  decoration: BoxDecoration(
                    color: AppColors.greenMain,
                    borderRadius: BorderRadius.circular(8), //
                  ), //
                ),
                Spacing.horizontal(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width * .4,
                      child: Text('TitleTit leTitleTi tleTitle TitleTitle tleTitle TitleTi tleTitle TitleTi', style: context.labelLarge, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(4),
                    SizedBox(
                      width: context.width * .4,
                      child: Text('TitleTit leTitleTi tleTitle TitleTitle tleTitle TitleTi tleTitle TitleTi', style: context.labelLarge, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(8),
                    bookDetailType == BookDetailType.star ? iconstar(stars: Random().nextInt(5)) : readprogress(progress: Random().nextInt(100), width: context.width * .35),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.play_circle_outline_rounded,
                  size: 48, //
                  color: AppColors.blueMain,
                ), //
                Spacing.horizontal(8),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static Widget continueReading({
    required BuildContext context,
    BookDetailType? bookDetailType = BookDetailType.star,
    EdgeInsetsGeometry? margin, //
  }) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.detailBook);
      },
      child: Container(
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: context.width * .275,
                  height: context.width * .4,
                  // margin: margin,
                  decoration: BoxDecoration(
                    color: AppColors.greenMain,
                    borderRadius: BorderRadius.circular(8), //
                  ), //
                ),
                Spacing.horizontal(16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: context.width * .5,
                      child: Text('TitleTit leTitleTi tleTitle TitleTitle tleTitle TitleTi tleTitle TitleTi', style: context.labelLarge, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(4),
                    SizedBox(
                      width: context.width * .5,
                      child: Text('TitleTit leTitleTi tleTitle TitleTitle tleTitle TitleTi tleTitle TitleTi', style: context.labelLarge, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Spacing.vertical(16),
                    readprogress(progress: Random().nextInt(100), width: context.width * .35),
                    Spacing.vertical(16),
                    ConstrainedBox(
                      constraints: BoxConstraints(minWidth: 40, maxWidth: context.width * .5),
                      child: AppButton.primary(
                        onPressed: () {
                          context.push(Routes.detailBook);
                        },
                        title: 'CONTINUE',
                        context: context,
                        height: 40, //
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
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
              color: AppColors.blueMain,
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
              for (int i = 0; i < 5; i++) Icon(Icons.star, color: AppColors.greyNonActive), //
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              for (int i = 0; i < (stars ?? 0); i++) Icon(Icons.star, color: AppColors.greenMain), //
            ],
          ),
        ],
      ),
    );
  }
}
