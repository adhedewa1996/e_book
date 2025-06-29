import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/animated.dart';
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Find Awesome Book', style: context.bodyLarge),
              Spacing.vertical(16),
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
              Spacing.vertical(16),
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
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          margin: EdgeInsets.only(bottom: 16, right: 12),
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
          child: Text(title, style: context.labelLarge),
        ),
      ),
    );
  }
}
