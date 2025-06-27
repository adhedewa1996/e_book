import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:e_books/commons/widgets/spacing.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:flutter/material.dart';

class ListBook extends StatelessWidget {
  const ListBook({
    super.key, //
    required this.header,
    this.bookDetailType,
  });

  final Widget header;
  final BookDetailType? bookDetailType;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        children: [
          header,
          Spacing.vertical(16),
          SizedBox(
            width: context.width,
            child: ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (context, index) {
                return Book.smallbook(
                  context: context,
                  bookDetailType: bookDetailType,
                  margin: EdgeInsets.only(bottom: 16), //
                );
              },
              separatorBuilder: (context, index) {
                return Spacing.vertical(16);
              },
            ),
          ),
        ],
      ), //
    );
  }
}
