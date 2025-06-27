import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/modules/favorites/favorites.dart';
import 'package:e_books/modules/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;
  bool isScrolled = true;

  void setIndex(int value) {
    _currentIndex = value;
    setState(() {});
  }

  void setSsScrolled(bool value) {
    isScrolled = value;
    setState(() {});
  }

  ScrollController? controller;

  @override
  void initState() {
    controller = ScrollController();
    controller?.addListener(() {
      if (isScrolled) {
        controller?.position.didStartScroll();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification notification) {
          if (notification is UserScrollNotification) {
            if (notification.direction == ScrollDirection.idle) {
              setSsScrolled(true);
            } else {
              if (isScrolled) {
                setSsScrolled(false);
              }
            }
          }
          return false;
        },
        child: [Home(controller: controller), Favorites()][_currentIndex], //,
      ),
      bottomNavigationBar: isScrolled
          ? TranslateAnimation(
              offset: (Get.height * .1),
              duration: const Duration(seconds: 1),
              child: Container(
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
                margin: const EdgeInsets.all(32),
                child: Row(
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
                        title: 'Favorite',
                        context: context, //
                      ),
                    ),
                    Spacing.horizontal(8),
                    Expanded(
                      child: AppButton.primary(
                        onPressed: () {
                          // setIndex(0);
                        },
                        isdisable: true,
                        title: 'Profile',
                        context: context, //
                      ),
                    ),
                    Spacing.horizontal(8),
                  ],
                ),
              ),
            )
          : SizedBox(),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
