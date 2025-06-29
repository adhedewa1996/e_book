import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/presentation/favorites/favorites.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:e_books/presentation/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  ScrollController? scrollController;

  void setIndex(int value) {
    _currentIndex = value;
    setState(() {});
  }

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          [
            Home(),
            Favorites(
              callback: () {
                setIndex(0);
              },
            ),
          ][_currentIndex],
          Obx(() {
            return AnimatedPositioned(
              duration: Duration(seconds: 1),
              left: (_currentIndex == 0 && !Get.find<HomeController>().isCalled.value) ? 2 : Get.width * .3,
              bottom: 2,
              child: TranslateAnimation(
                duration: Duration(seconds: 2),
                offsetDirection: Axis.horizontal,
                child: Container(
                  width: 56,
                  height: 56,
                  margin: EdgeInsets.only(left: 16, bottom: 32),
                  decoration: BoxDecoration(
                    color: AppColors.darkMain,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.whiteMain.withValues(alpha: 0.7),
                        blurRadius: 2,
                        offset: Offset(2, 2), //
                      ),
                    ],
                    borderRadius: BorderRadius.circular(100), //
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.find<HomeController>().backTopTop();
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
              left: (_currentIndex == 0 && !Get.find<HomeController>().isCalled.value) ? 80 : 16,
              right: 16,
              duration: Duration(seconds: 1),
              child: bottomNav(), //
            );
          }),
        ],
      ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }

  Widget bottomNav() {
    return AnimatedContainer(
      duration: Duration(microseconds: 100),
      curve: Curves.fastOutSlowIn,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
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
      // margin: const EdgeInsets.all(32),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Spacing.horizontal(8),
          Expanded(
            child: AppButton.primary(
              onPressed: () {
                setIndex(0);
              },
              isdisable: _currentIndex != 0,
              title: 'Home',
              context: context, //
            ),
          ),
          Spacing.horizontal(8),
          Expanded(
            child: AppButton.primary(
              onPressed: () {
                setIndex(1);
              },
              isdisable: _currentIndex != 1,
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
