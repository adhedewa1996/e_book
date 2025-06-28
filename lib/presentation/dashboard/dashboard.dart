import 'package:e_books/commons/widgets/buttons.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/presentation/favorites/favorites.dart';
import 'package:e_books/presentation/home/home.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _currentIndex = 0;

  void setIndex(int value) {
    _currentIndex = value;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [Home(), Favorites()][_currentIndex],
      bottomNavigationBar: Container(
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
          ],
        ),
      ),
      // floatingActionButton: Container(
      //   width: 56,
      //   height: 56,
      //   margin: EdgeInsets.only(right: 8),
      //   decoration: BoxDecoration(
      //     color: AppColors.whiteMain,
      //     boxShadow: [
      //       BoxShadow(
      //         color: AppColors.greyNonActive,
      //         blurRadius: 5,
      //         offset: Offset(5, 5), //
      //       ),
      //     ],
      //     borderRadius: BorderRadius.circular(100), //
      //   ),
      //   child: IconButton(
      //     onPressed: () {
      //       Get.find<HomeController>().scrollController?.animateTo(0, duration: Duration(seconds: 2), curve: Curves.easeIn).then((a) {});
      //     },
      //     icon: Icon(Icons.keyboard_arrow_up_rounded), //
      //   ),
      // ),
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      extendBody: true,
    );
  }
}
