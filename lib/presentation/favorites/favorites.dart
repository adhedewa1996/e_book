import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/state_check.dart';
import 'package:e_books/core/config/assets/app_images.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/core/config/constants/helper.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/data/repositories/favorite.dart';
import 'package:e_books/presentation/favorites/getx/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Favorites extends GetView<FavoriteController> {
  const Favorites({
    super.key, //
    this.callback,
  });

  final Function()? callback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MY BOOKSHELF', style: context.titleMedium), //
        titleSpacing: 16,
        actions: [
          Icon(Icons.notifications_rounded, color: AppColors.darkMain, size: 36),
          Spacing.horizontal(8),
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(100),
            child: AppImage.assets(
              name: AppImages.userProfile,
              width: 42,
              height: 42, //
            ),
          ),
          Spacing.horizontal(16),
        ],
      ),
      body: Container(
        width: Get.width,
        height: Get.height,
        padding: EdgeInsets.symmetric(horizontal: 16),
        color: AppColors.whiteMain,
        child: ListView(
          controller: controller.scrollController,
          shrinkWrap: true,
          children: [
            Spacing.vertical(16), quote(context), Spacing.vertical(16), list(), Spacing.vertical(Get.height * .15), //
          ], //
        ),
      ),
    );
  }

  Widget quote(BuildContext context) {
    return TranslateAnimation(
      duration: Duration(seconds: 2),
      offset: -(Get.height * .4),
      child: Container(
        constraints: BoxConstraints(maxHeight: 225),
        width: Get.width, //
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Helper.randomColor(),
          boxShadow: [
            BoxShadow(
              color: AppColors.greyNonActive,
              blurRadius: 5,
              offset: Offset(5, 5), //
            ),
          ],
          borderRadius: BorderRadius.circular(8), //
        ),
        child: Stack(
          children: [
            AppImage.randomImageCoverVertical(context),
            Container(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  Helper.randomQuote(),
                  style: context.bodyLarge?.toWhite, //
                  textAlign: TextAlign.center,
                ), //
              ), //,
            ),
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ValueListenableBuilder(
      valueListenable: FavoriteRepositoryImpl().getBooks().listenable(),
      builder: (context, value, child) {
        var books = value.values.toList();
        if (books.isEmpty) {
          return Column(
            children: [
              StateCheck.empty(),
              Transform.translate(
                offset: Offset(0, -48),
                child: SizedBox(
                  width: Get.width * .5,
                  child: AppButton.primary(
                    onPressed: () {
                      // setIndex(1);
                      callback?.call();
                    },
                    isdisable: false,
                    title: 'Add to Bookshelf',
                    context: context, //
                  ),
                ),
              ),
            ],
          );
        }
        return SizedBox(
          width: Get.width,
          child: ListView(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            children: [
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: books.length,
                itemBuilder: (context, index) {
                  final item = books[index];
                  return TranslateAnimation(
                    duration: Duration(milliseconds: 1000 + (index * 200)),
                    offsetDirection: Axis.horizontal,
                    offset: Get.width * .4,
                    child: Book.smallbook(
                      bookEntity: item,
                      context: context,
                      bookDetailType: BookDetailType.progress,
                      margin: EdgeInsets.only(bottom: 16), //
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return Spacing.vertical(16);
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
