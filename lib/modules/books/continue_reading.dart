import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/book.dart';
import 'package:flutter/material.dart';

class ContinueReading extends StatelessWidget {
  const ContinueReading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Continue Reading', style: context.titleMedium),
          ),
          Book.continueReading(
            context: context,
            margin: EdgeInsets.only(
              // right: 16,
              bottom: 16,
              top: 16, //
            ),
          ),
        ],
      ), //
    );
  }
}
