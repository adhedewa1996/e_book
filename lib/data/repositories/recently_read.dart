import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/recently_read.dart';
import 'package:hive_flutter/hive_flutter.dart';

class RecentlyReadRepositoryImpl implements RecentlyReadRepository {
  RecentlyReadRepositoryImpl();

  @override
  Box<BookEntity> getBooks() {
    Box<BookEntity> favorite = Hive.box('recenly_read');
    return favorite;
  }

  @override
  Future<void> put(BookEntity book) async {
    Box<BookEntity> favorite = Hive.box('recenly_read');
    final list = favorite.values.toList();
    if (list.isEmpty) {
      await favorite.add(book);
    } else {
      await favorite.put(0, book);
    }
  }
}
