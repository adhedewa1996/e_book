import 'dart:math';

import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/extentions/string_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/commons/widgets/textfield.dart';
import 'package:e_books/core/config/constants/dummy_data.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: Icon(
              Icons.close_outlined,
              size: 32,
              color: Colors.black, //
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: ListView(
            shrinkWrap: true,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Find Awesome Book', style: context.bodyLarge),
              Spacing.vertical(4),
              Book.tagline(context),
              Spacing.vertical(4),
              AppTextField(
                context: context,
                hint: 'Search',
                enabled: true,
                controller: TextEditingController(), //
                callback: (keyword) {
                  context.push('${Routes.searchResult}/1/$keyword');
                },
              ),
              Spacing.vertical(32),
              Text('Popular Categories', style: context.bodyLarge),
              Spacing.vertical(32),
              Wrap(
                children: [
                  for (int i = 0; i < DummyData.popularBookTopics.length; i++) box(DummyData.popularBookTopics[i], context, i), //
                ],
              ),
              //
            ],
          ),
        ),
      ), //
    );
  }

  Widget box(String title, BuildContext context, int index) {
    return TranslateAnimation(
      duration: Duration(milliseconds: 2000 + (100 * index)),
      offsetDirection: Axis.horizontal,
      child: GestureDetector(
        onTap: () {
          context.push('${Routes.searchResult}/1/$title');
        },
        child: IntrinsicWidth(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            margin: EdgeInsets.only(bottom: 28, right: 20),
            decoration: BoxDecoration(
              color: AppColors.whiteMain,
              boxShadow: [
                BoxShadow(
                  color: AppColors.greyNonActive,
                  blurRadius: 5,
                  offset: Offset(5, 5), //
                ),
              ],
              borderRadius: BorderRadius.circular(8), //
            ),
            child: Stack(
              children: [
                Text(title, style: context.labelLarge),
                Align(
                  alignment: Alignment.topRight,
                  child: Transform.translate(
                    offset: Offset(30, -28),
                    child: OpacityAnimation(
                      duration: Duration(seconds: 1),
                      child: TranslateAnimation(
                        offset: 24,
                        duration: Duration(seconds: 2),
                        offsetDirection: Axis.horizontal,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppColors.darkMain,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                              topLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12), //
                            ), //
                          ),
                          child: IntrinsicWidth(
                            child: Text(
                              (Random().nextInt(1000)).countSimplify(),
                              style: context.labelMedium?.toWhite,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis, //
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
