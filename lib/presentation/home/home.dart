import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/images.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/textfield.dart';
import 'package:e_books/core/config/assets/app_images.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/presentation/home/getx/books/continue_reading.dart';
import 'package:e_books/presentation/home/getx/books/list_book.dart';
import 'package:e_books/presentation/home/getx/books/slider_book.dart';
import 'package:e_books/presentation/home/getx/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key, this.controller});

  final ScrollController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('HOME', style: context.titleLarge), //
        leading: Icon(
          Icons.menu_outlined,
          size: 32,
          color: AppColors.blueMain, //
        ),
        actions: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(100),
            child: AppImage.assets(name: AppImages.userProfile, width: 40),
          ),
          Spacing.horizontal(16),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<HomeController>().getData();
        },
        child: Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.symmetric(horizontal: 16),
          color: AppColors.whiteMain,
          child: ListView(
            controller: controller,
            shrinkWrap: true,
            children: [
              Spacing.vertical(32),
              header(context),
              Spacing.vertical(32),
              ContinueReading(),
              Spacing.vertical(32),
              SliderBook(),
              Spacing.vertical(32),
              ListBook(
                bookDetailType: BookDetailType.star,
                header: Text('Best Sellers', style: context.titleMedium),
              ), //
              Spacing.vertical(Get.height * .15),
            ], //
          ),
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Welcome, Max Loween', style: context.labelLarge),
          Spacing.vertical(8),
          Text('What would you like to read today?', style: context.bodyLarge),
          Spacing.vertical(8),
          AppTextField(
            context: context,
            hint: 'Search',
            suffixIcon: Icon(
              Icons.bubble_chart_rounded,
              color: AppColors.blueMain, //
            ),
            controller: TextEditingController(), //
          ), //
        ],
      ), //
    );
  }
}
