import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/shadow_box.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/assets/app_images.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/presentation/dashboard/getx/dashboard_controller.dart';
import 'package:e_books/presentation/favorites/favorites.dart';
import 'package:e_books/presentation/favorites/getx/favorite_controller.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:e_books/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends GetView<DashboardController> {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Icon(Icons.apps_rounded, color: AppColors.darkMain, size: 36),
        ),
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
      body: Stack(
        children: [
          DefaultTabController(
            length: 2,
            animationDuration: Duration(seconds: 3),
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: controller.controller,
              children: [
                Home(),
                Favorites(
                  callback: () {
                    controller.setIndex(0);
                  },
                ),
              ],
            ),
          ),
          Obx(() {
            if (controller.widthHelper.value != null) {
              return SizedBox();
            }
            return AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: (controller.currentIndex.value == 0 && !Get.find<HomeController>().isCalled.value) ? 2 : controller.widthHelper.value,
              right: controller.currentIndex.value == 1 ? 16 : controller.widthHelper.value,
              bottom: 2,
              child: TranslateAnimation(
                offset: controller.currentIndex.value == 0 ? 40 : -40,
                duration: Duration(seconds: 1),
                offsetDirection: Axis.horizontal,
                child: Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.only(left: 16, bottom: 32),
                  decoration: BoxDecoration(
                    color: AppColors.darkMain,
                    boxShadow: ShadowBox.normal(color: AppColors.whiteMain.withValues(alpha: 0.7)),
                    borderRadius: BorderRadius.circular(100), //
                  ),
                  child: IconButton(
                    onPressed: () {
                      if (controller.currentIndex.value == 0) {
                        Get.find<HomeController>().backToTop();
                      } else {
                        Get.find<FavoriteController>().backToTop();
                      }
                    },
                    icon: Icon(Icons.keyboard_arrow_up_rounded, color: AppColors.whiteMain), //
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            return AnimatedPositioned(
              bottom: 32,
              left: (controller.currentIndex.value == 0 && !Get.find<HomeController>().isCalled.value) ? 80 : 12,
              right: controller.currentIndex.value == 1 ? 80 : 16,
              duration: Duration(milliseconds: 500),
              child: bottomNav(context), //
            );
          }),
        ],
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }

  Widget bottomNav(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 100),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.whiteMain,
        boxShadow: ShadowBox.normal(),
        borderRadius: BorderRadius.circular(64), //
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacing.horizontal(8),
          Expanded(
            child: AppButton.primary(
              onPressed: () {
                if (controller.currentIndex.value != 0) controller.setIndex(0);
              },
              isdisable: controller.currentIndex.value != 0,
              title: 'Home',
              context: context, //
            ),
          ),
          Spacing.horizontal(8),
          Expanded(
            child: AppButton.primary(
              onPressed: () {
                if (controller.currentIndex.value != 1) controller.setIndex(1);
              },
              isdisable: controller.currentIndex.value != 1,
              title: 'Bookshelf',
              context: context, //
            ),
          ),
          Spacing.horizontal(8),
        ],
      ),
    );
  }
}
