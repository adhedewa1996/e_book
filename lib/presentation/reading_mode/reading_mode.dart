import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/assets/app_images.dart';
import 'package:e_books/core/config/constants/dummy_data.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/domain/entities/story.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class ReadingMode extends StatefulWidget {
  const ReadingMode({super.key});

  @override
  State<ReadingMode> createState() => _ReadingModeState();
}

class _ReadingModeState extends State<ReadingMode> {
  final ScrollController _scrollController = ScrollController();
  double _offset = 0.0;
  double bookHeight = 0;
  double readPosition = 0;
  double progress = 0;
  double perinch = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_setOffset);
  }

  void _setOffset() {
    setState(() {
      _offset = _scrollController.offset;
      bookHeight = _scrollController.position.maxScrollExtent;
      if (_scrollController.position.pixels > 0) {
        readPosition = _scrollController.position.pixels;
      }
      progress = (readPosition / bookHeight).clamp(0.0, 1.0);
      perinch = bookHeight / Get.width;
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Positioned(
                      top: -_offset * 0.5,
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
                    ),
                    Container(
                      width: Get.width,
                      height: Get.height,
                      color: AppColors.whiteMain.withValues(alpha: .9), //
                    ),
                  ],
                ),
              ),
            ),
            story(storyEntity: DummyData.story),
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
                      Colors.white, // top - fully opaque
                      Colors.white, // top - fully opaque
                      Colors.white, // top - fully opaque
                      Colors.white.withValues(alpha: 0.5), // bottom - fully transparent
                      Colors.white.withValues(alpha: 0.2), // bottom - fully transparent
                      Colors.white.withValues(alpha: 0.0), // bottom - fully transparent
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 100, // or any height you want
                width: Get.width,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white.withValues(alpha: 0.0), // bottom - fully transparent
                      Colors.white.withValues(alpha: 0.2), // bottom - fully transparent
                      Colors.white.withValues(alpha: 0.5), // bottom - fully transparent
                      Colors.white, // top - fully opaque
                      Colors.white, // top - fully opaque
                      Colors.white, // top - fully opaque
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
            if (progress > 0.01)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: (progress * (Get.width - 200)),
                  height: 6,
                  margin: EdgeInsets.only(bottom: 32, left: 100, right: 100),
                  decoration: BoxDecoration(
                    color: AppColors.blueMain,
                    borderRadius: BorderRadius.circular(100), //
                  ),
                ),
              ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                width: 56,
                height: 56,
                margin: EdgeInsets.only(left: 32, top: 48),
                decoration: BoxDecoration(
                  color: AppColors.whiteMain,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyNonActive,
                      blurRadius: 5,
                      offset: Offset(5, 5), //
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100), //
                ),
                child: IconButton(
                  onPressed: () {
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
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyNonActive,
                      blurRadius: 5,
                      offset: Offset(5, 5), //
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100), //
                ),
                child: IconButton(
                  onPressed: () {
                    _scrollController.animateTo(0, duration: Duration(seconds: 2), curve: Curves.easeIn).then((a) {
                      progress = 0;
                      setState(() {});
                    });
                  },
                  icon: Icon(Icons.keyboard_arrow_up_rounded), //
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 56,
                height: 56,
                margin: EdgeInsets.only(right: 32, bottom: 120),
                decoration: BoxDecoration(
                  color: AppColors.whiteMain,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.greyNonActive,
                      blurRadius: 5,
                      offset: Offset(5, 5), //
                    ),
                  ],
                  borderRadius: BorderRadius.circular(100), //
                ),
                child: IconButton(
                  onPressed: () {
                    // context.pop();
                  },
                  icon: Icon(Icons.play_circle_filled_rounded, size: 32), //
                ),
              ),
            ),
          ],
        ), //
      ), //
    );
  }

  Widget story({required StoryEntity storyEntity}) {
    return NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification is ScrollUpdateNotification) {
          _setOffset();
        }
        return true;
      },
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
        controller: _scrollController,
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
                  style: context.titleMedium?.copyWith(height: 1.75, fontSize: 20),
                  textAlign: TextAlign.justify, //
                ),
                Spacing.vertical(16),
                for (String content in chapter.content)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Text(
                      content,
                      style: context.labelMedium?.copyWith(height: 2, fontSize: 16),
                      textAlign: TextAlign.justify, //
                    ),
                  ), //
              ],
            ),
          Spacing.vertical(Get.height * .1),
        ],
      ),
    );
  }
}
