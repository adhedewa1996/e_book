import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:e_books/commons/extentions/double_ext.dart';
import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/shadow_box.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/assets/app_vectors.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/data/sources/local/recently_read.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/presentation/audio_book_mode/getx/audio_book_controller.dart';
import 'package:e_books/routing/app_routes.dart';
import 'package:e_books/routing/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_music_visualizer/mini_music_visualizer.dart';

class AudioBookMode extends GetView<AudioBookController> {
  const AudioBookMode({
    super.key, //
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.audioMode.value == 0) {
        return SizedBox();
      }
      return RepaintBoundary(
        child: Stack(
          children: [
            Positioned(
              bottom: controller.bottom.value,
              left: controller.left.value,
              right: controller.right.value,
              child: TranslateAnimation(
                duration: Duration(seconds: 1),
                offset: Get.height * .3,
                child: AvatarGlow(
                  startDelay: const Duration(milliseconds: 1000),
                  glowColor: AppColors.greenMain,
                  glowShape: BoxShape.circle,
                  curve: Curves.fastOutSlowIn,
                  glowRadiusFactor: controller.audioMode.value == 1 ? .5 : 0,
                  child: Container(
                    constraints: BoxConstraints(minWidth: 55, minHeight: 55),
                    width: controller.width.value,
                    height: controller.height.value,
                    decoration: BoxDecoration(
                      color: AppColors.darkMain, //
                      boxShadow: ShadowBox.normal(color: AppColors.whiteMain.withValues(alpha: .9)),
                      borderRadius: BorderRadius.circular(controller.audioMode.value == 1 ? 100 : 8), //
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(controller.audioMode.value == 1 ? 100 : 8),
                      child: AppImage.svg(
                        name: AppVectors.waveBig2,
                        fit: BoxFit.cover,
                        width: Get.width,
                        height: Get.height, //
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: controller.bottom.value,
              left: controller.left.value,
              right: controller.right.value,
              child: TranslateAnimation(
                duration: Duration(seconds: 1),
                offset: Get.height * .3,
                child: Stack(
                  children: [
                    Container(
                      constraints: BoxConstraints(minWidth: 55, minHeight: 55),
                      width: controller.width.value,
                      height: controller.height.value,
                      decoration: BoxDecoration(
                        color: AppColors.darkMain.withValues(alpha: 0.35), //
                        borderRadius: BorderRadius.circular(controller.audioMode.value == 1 ? 100 : 8), //
                      ),
                      //
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (controller.audioMode.value == 3) fullmode(book: controller.bookEntity, context: context),
                          if (controller.audioMode.value == 2) smallmode(book: controller.bookEntity, context: context),
                          if (controller.audioMode.value == 1) iconmode(book: controller.bookEntity, context: context, controller: controller),
                          if (controller.audioMode.value > 1)
                            buttons(
                              controller: controller,
                              context: context, //
                            ),
                        ],
                      ),
                    ),
                    if (controller.audioMode.value > 1)
                      Positioned(
                        top: 4,
                        right: 4,
                        child: Container(
                          padding: EdgeInsets.all(8),
                          child: box(
                            callback: () {
                              controller.removeAudioMode();
                            },
                            context: context,
                            icon: Icons.close_outlined,
                            usePadding: true,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget buttons({required AudioBookController controller, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.only(bottom: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Spacing.horizontal(16),
              if (controller.audioMode.value < 3)
                box(
                  callback: () {
                    // if (mounted) {
                    controller.fullmode();
                    // }
                  },
                  context: context,
                  icon: Icons.fullscreen_rounded,
                ),
              if (controller.audioMode.value > 2)
                box(
                  callback: () {
                    // if (mounted) {
                    controller.smallmode(reInit: true);
                    // }
                  },
                  context: context,
                  icon: Icons.fullscreen_exit_rounded,
                ),
              if (controller.audioMode.value > 1)
                box(
                  callback: () {
                    // if (mounted) {
                    controller.iconmode();
                    // }
                  },
                  context: context,
                  icon: Icons.minimize_rounded,
                ),
            ],
          ),
          IntrinsicWidth(
            child: Row(
              children: [
                for (int i = 0; i < 7; i++)
                  Container(
                    constraints: BoxConstraints(maxHeight: 30),
                    child: MiniMusicVisualizer(
                      color: Colors.white,
                      width: 4,
                      height: 4.0.minMax(20),
                      animate: controller.playAudio.value,
                      radius: 8, //
                    ),
                  ),
              ],
            ),
          ),
          box(
            callback: () {
              // if (mounted) {
              controller.setAudioPlay(!controller.playAudio.value);
              // }
            },
            context: context,
            icon: controller.playAudio.value ? Icons.play_arrow_rounded : Icons.pause_rounded,
            usePadding: false,
          ),
        ],
      ),
    );
  }

  Widget fullmode({required BookEntity book, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              while (router.canPop()) {
                router.pop();
              }
              router.push('${Routes.detailBook}/${book.id}');
              sl<RecentlyReadServices>().put(book);
            },
            child: Book.coverbook(
              cover: book.cover ?? '',
              width: 90,
              height: 120,
              gap: 8,
              gapBorderRadius: 8,
              borderRadius: 8, //
            ),
          ),
          Spacing.horizontal(16),
          SizedBox(
            width: Get.width * .425,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title ?? '', style: context.labelMedium?.toWhite, maxLines: 2, overflow: TextOverflow.ellipsis),
                Spacing.vertical(12),
                Text(book.author ?? '', style: context.labelMedium?.toWhite, maxLines: 2, overflow: TextOverflow.ellipsis),
                Spacing.vertical(12),
                ReadProgress(
                  width: Get.width * .5,
                  progress: Random().nextInt(100), //
                  color: AppColors.greenMain,
                ),
                //
              ],
            ),
          ),
          //
        ],
      ),
    );
  }

  Widget smallmode({required BookEntity book, required BuildContext context}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 17, horizontal: 8),
      child: Row(
        children: [
          Spacing.horizontal(12),
          GestureDetector(
            onTap: () {
              while (router.canPop()) {
                router.pop();
              }
              router.push('${Routes.detailBook}/${book.id}');
              sl<RecentlyReadServices>().put(book);
            },
            child: Book.coverbook(
              cover: book.cover ?? '',
              width: 45,
              height: 60,
              gap: 4,
              gapBorderRadius: 4,
              borderRadius: 4, //
            ),
          ),
          Spacing.horizontal(12),
          SizedBox(
            width: Get.width * .475,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(book.title ?? '', style: context.labelMedium?.toWhite, maxLines: 2, overflow: TextOverflow.ellipsis),
                Spacing.vertical(12),
                Text(book.author ?? '', style: context.labelMedium?.toWhite),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }

  Widget iconmode({
    required BookEntity book,
    required BuildContext context, //
    required AudioBookController controller,
  }) {
    return GestureDetector(
      onTap: () {
        controller.fullmode();
      },
      child: Container(
        constraints: BoxConstraints(minWidth: 45, minHeight: 45),
        child: Stack(
          children: [
            Book.coverbook(
              cover: book.cover ?? '',
              width: 45,
              height: 45,
              gap: 4,
              gapBorderRadius: controller.audioMode.value == 1 ? 100 : 4,
              borderRadius: controller.audioMode.value == 1 ? 100 : 4, //
              fit: BoxFit.cover,
            ),
            Container(
              width: 45,
              height: 45,
              decoration: BoxDecoration(
                color: AppColors.darkMain.withValues(alpha: 0.1), //
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget box({
    required Function() callback, //
    required BuildContext context,
    required IconData? icon,
    bool usePadding = false,
  }) {
    return GestureDetector(
      onTap: () {
        // if (mounted) {
        callback.call();
        // }
      },
      child: Container(
        width: 24,
        height: 24,
        margin: EdgeInsets.only(right: usePadding ? 0 : 12),
        child: Center(child: Icon(icon, color: AppColors.whiteMain)),
      ),
    );
  }
}
