import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/comment.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/shadow_box.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/assets/app_images.dart';
import 'package:e_books/core/config/constants/dummy_data.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/entities/story.dart';
import 'package:e_books/presentation/audio_book_mode/getx/audio_book_controller.dart';
import 'package:e_books/presentation/reading_mode/getx/reading_mode_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ReadingMode extends GetView<ReadingModeController> {
  const ReadingMode({
    super.key, //
    required this.bookEntity,
  });
  final BookEntity bookEntity;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvokedWithResult: (didPop, result) {
        Get.delete<ReadingModeController>();
      },
      child: Scaffold(
        body: Container(
          width: Get.width,
          height: Get.height,
          color: AppColors.whiteMain,
          //
          child: Stack(
            children: [
              IntrinsicHeight(
                child: OverflowBox(
                  maxWidth: Get.width,
                  maxHeight: Get.height,
                  child: Stack(
                    children: [
                      Obx(() {
                        return Positioned(
                          top: -controller.offset * 0.5,
                          child: Column(
                            children: [
                              SizedBox(
                                width: Get.width,
                                child: AppImage.assets(
                                  name: AppImages.medievalBackground,
                                  fit: BoxFit.fitWidth, //
                                ),
                              ),
                              SizedBox(
                                width: Get.width,
                                child: AppImage.assets(
                                  name: AppImages.medievalBackground,
                                  fit: BoxFit.fitWidth, //
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                      Container(
                        width: Get.width,
                        height: Get.height,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white.withValues(alpha: 0.2),
                              Colors.white.withValues(alpha: 0.3),
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white,
                              Colors.white, //
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              story(storyEntity: DummyData.story, context: context),
              Positioned(
                top: 0,
                child: Container(
                  height: 100, // or any height you want
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white,
                        Colors.white.withValues(alpha: 0.8),
                        Colors.white.withValues(alpha: 0.6),
                        Colors.white.withValues(alpha: 0.4),
                        Colors.white.withValues(alpha: 0.2),
                        Colors.white.withValues(alpha: 0.0), //
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 100,
                  width: Get.width,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white.withValues(alpha: 0.0), Colors.white.withValues(alpha: 0.3), Colors.white.withValues(alpha: 0.7), Colors.white, Colors.white, Colors.white, //
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: Get.width,
                  height: 6,
                  margin: EdgeInsets.only(bottom: 32, left: 100, right: 100),
                  decoration: BoxDecoration(
                    color: AppColors.greyTeritary,
                    borderRadius: BorderRadius.circular(100), //
                  ),
                ),
              ),
              Obx(() {
                if (controller.progress > 0.01) {
                  return Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: (controller.progress * (Get.width - 200)),
                      height: 6,
                      margin: EdgeInsets.only(bottom: 32, left: 100, right: 100),
                      decoration: BoxDecoration(
                        color: AppColors.darkMain,
                        borderRadius: BorderRadius.circular(100), //
                      ),
                    ),
                  );
                }
                return SizedBox();
              }),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.only(left: 32, top: 48),
                  decoration: BoxDecoration(
                    color: AppColors.whiteMain,
                    boxShadow: ShadowBox.normal(),
                    borderRadius: BorderRadius.circular(100), //
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.delete<ReadingModeController>();
                      context.pop();
                    },
                    icon: Icon(Icons.close_rounded), //
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.only(right: 32, bottom: 48),
                  decoration: BoxDecoration(
                    color: AppColors.whiteMain,
                    boxShadow: ShadowBox.normal(),
                    borderRadius: BorderRadius.circular(100), //
                  ),
                  child: IconButton(
                    onPressed: () {
                      controller.scrollController?.animateTo(0, duration: Duration(seconds: 2), curve: Curves.easeIn).then((a) {
                        controller.progress.value = 0;
                      });
                    },
                    icon: Icon(Icons.keyboard_arrow_up_rounded), //
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.only(left: 32, bottom: 48),
                  decoration: BoxDecoration(
                    color: AppColors.whiteMain,
                    boxShadow: ShadowBox.normal(),
                    borderRadius: BorderRadius.circular(100), //
                  ),
                  child: IconButton(
                    onPressed: () {
                      final audio = Get.find<AudioBookController>();
                      audio.setBook(bookEntity);
                      audio.smallmode(reInit: true);
                    },
                    icon: Icon(Icons.play_circle_filled_rounded, size: 32), //
                  ),
                ),
              ),
            ],
          ), //
        ), //
      ),
    );
  }

  Widget story({required StoryEntity storyEntity, required BuildContext context}) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          controller.setOffset();
        }
        return true;
      },
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        controller: controller.scrollController,
        children: [
          Spacing.vertical(48),
          Text(
            storyEntity.title,
            style: context.titleLarge?.copyWith(height: 1.75),
            textAlign: TextAlign.center, //
          ),
          for (Chapter chapter in storyEntity.chapter)
            Column(
              children: [
                Spacing.vertical(32),
                AppImage.assets(name: AppImages.separator, fit: BoxFit.fitWidth),
                Spacing.vertical(32),
                Text(
                  chapter.title,
                  style: context.titleMedium?.copyWith(height: 1.75),
                  textAlign: TextAlign.justify, //
                ),
                Spacing.vertical(16),
                for (int i = 0; i < chapter.contents.length; i++)
                  Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 36),
                        padding: EdgeInsets.only(bottom: 36),
                        child: Stack(
                          children: [
                            Transform.translate(
                              offset: Offset(0, 36),
                              child: Text(
                                chapter.contents[i].text,
                                style: context.labelMedium?.copyWith(height: 2),
                                textAlign: TextAlign.justify, //
                              ),
                            ),
                            if (chapter.contents[i].reviews.isNotEmpty)
                              Positioned(
                                top: 0,
                                right: 2,
                                child: CommentToolTip(
                                  reviews: chapter.contents[i].reviews, //
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ), //
                Text(
                  'Reader Reactions \n${chapter.title}',
                  style: context.labelMedium?.copyWith(height: 1.75).toBold,
                  textAlign: TextAlign.center, //
                ),
                Spacing.vertical(32),
                Comment.reviews(
                  reviews: chapter.reviews,
                  context: context, //
                  width: Get.width * .4 - 4,
                ),
              ],
            ),
          Spacing.vertical(Get.height * .1),
        ],
      ),
    );
  }
}
