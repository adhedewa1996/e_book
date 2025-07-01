import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/recently_read.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecentlyReadRepositoryImpl implements RecentlyReadRepository {
  RecentlyReadRepositoryImpl();

  @override
  Future<void> put(BookEntity book) async {
    Box<BookEntity> favorite = Hive.box(ConstantDataType.recenlyRead);
    final list = favorite.values.toList();
    if (list.isEmpty) {
      await favorite.add(book);
    } else {
      await favorite.put(0, book);
    }
  }

  @override
  Box<BookEntity> getBooks() {
    Box<BookEntity> favorite = Hive.box(ConstantDataType.recenlyRead);
    return favorite;
  }
}
