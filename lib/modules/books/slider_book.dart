import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:flutter/material.dart';

class SliderBook extends StatelessWidget {
  const SliderBook({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Your Bookshelf', style: context.titleMedium),
              Text('All', style: context.labelLarge), //
            ], //
          ),
          SizedBox(
            width: context.width,
            height: context.width * .85,
            child: ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Book.book(
                  context: context,
                  margin: EdgeInsets.only(
                    // right: 16,
                    bottom: 16,
                    top: 16, //
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Spacing.horizontal(16);
              },
            ),
          ),
        ],
      ), //
    );
  }
}
