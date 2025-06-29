import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/constants/helper.dart';
import 'package:e_books/data/repositories/recently_read.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContinueReading extends GetView<HomeController> {
  const ContinueReading({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        if (!controller.status.isSuccess) {
          return SizedBox();
        }
        return SizedBox(
          width: Get.width,
          child: TranslateAnimation(
            duration: Duration(seconds: 3),
            offset: -(Get.height * .5),
            child: recentlyRead(), //
          ), //
        );
      },
    );
  }

  Widget recentlyRead() {
    return ValueListenableBuilder(
      valueListenable: RecentlyReadRepositoryImpl().getBooks().listenable(),
      builder: (context, value, child) {
        var books = value.values.toList();
        if (books.isEmpty) {
          return SizedBox();
        }
        return Container(
          constraints: BoxConstraints(maxHeight: Get.height * .235),
          decoration: BoxDecoration(
            color: Helper.randomColor(),
            // color: AppColors.greenMain,
            borderRadius: BorderRadius.circular(16), //
          ), //
          margin: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Stack(
            children: [
              AppImage.randomImageCoverVertical(context),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacing.vertical(8),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text('Continue Reading', style: context.bodyLarge?.toWhite),
                  ),
                  Book.continueReading(
                    bookEntity: books.first,
                    context: context,
                    margin: EdgeInsets.only(
                      bottom: 16,
                      top: 16, //
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
