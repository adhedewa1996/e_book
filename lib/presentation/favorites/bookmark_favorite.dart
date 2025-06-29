import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/data/repositories/favorite.dart';
import 'package:e_books/data/sources/favorite.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

Widget iconFavorite({required BookEntity item}) {
  return ValueListenableBuilder(
    valueListenable: FavoriteRepositoryImpl().getBooks().listenable(),
    builder: (context, value, child) {
      bool isMarked = false;
      var favoriteSaved = value.values.toList();
      if (favoriteSaved.isNotEmpty) {
        final List<BookEntity> news = favoriteSaved.map((e) => e).toList();
        if (news.isNotEmpty) {
          for (var result in news) {
            if (result.id == item.id) {
              isMarked = true;
            }
          }
        }
      }
      return Container(
        width: 60,
        height: 60,
        padding: EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        margin: const EdgeInsets.only(left: 18, bottom: 32, right: 12),
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
        child: IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(isMarked ? Icons.favorite : Icons.favorite_border_rounded, color: AppColors.redDanger),
          onPressed: () {
            if (isMarked) {
              sl<FavoriteServices>().remove(item);
            } else {
              sl<FavoriteServices>().add(item);
            }
          },
        ),
      );
    },
  );
}
