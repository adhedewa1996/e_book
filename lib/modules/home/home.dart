import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/textfield.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/modules/books/continue_reading.dart';
import 'package:e_books/modules/books/list_book.dart';
import 'package:e_books/modules/books/slider_book.dart';
import 'package:flutter/material.dart';

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
          Icons.bubble_chart_rounded,
          color: AppColors.blueMain, //
        ),
        actions: [
          Icon(
            Icons.bubble_chart_rounded,
            color: AppColors.blueMain, //
          ),
          Spacing.horizontal(16),
        ],
      ),
      body: Container(
        width: context.width,
        height: context.height,
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
              header: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Best Sellers', style: context.titleMedium),
                  Text('All', style: context.labelLarge), //
                ], //
              ),
            ), //
            Spacing.vertical(context.height * .15),
          ], //
        ),
      ),
    );
  }

  Widget header(BuildContext context) {
    return SizedBox(
      width: context.width,
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
