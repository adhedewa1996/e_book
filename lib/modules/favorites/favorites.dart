import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/modules/books/list_book.dart';
import 'package:flutter/material.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('FAVORITE', style: context.titleLarge), //
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
          shrinkWrap: true,
          children: [
            Spacing.vertical(16),
            ListBook(
              header: Column(
                children: [
                  Text('Your Favorite are here!', style: context.titleMedium), //
                  Spacing.vertical(16),
                  Container(
                    height: 200,
                    width: context.width, //
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      color: AppColors.blueMain,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyNonActive,
                          blurRadius: 5,
                          offset: Offset(5, 5), //
                        ),
                      ],
                      borderRadius: BorderRadius.circular(8), //
                    ),
                  ),
                ], //
              ),
            ), //
            Spacing.vertical(context.height * .15),
          ], //
        ),
      ),
    );
  }
}
