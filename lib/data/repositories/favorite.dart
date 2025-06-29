import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/favorite.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteRepositoryImpl implements FavoriteRepository {
  FavoriteRepositoryImpl();

  @override
  Box<BookEntity> getBooks() {
    Box<BookEntity> favorite = Hive.box('favorite');
    return favorite;
  }

  @override
  Future<void> remove(BookEntity book) async {
    Box<BookEntity> favorite = Hive.box('favorite');
    final index = favorite.values.toList().indexWhere((element) => book.id == element.id);
    await favorite.deleteAt(index);
  }

  @override
  Future<void> add(BookEntity book) async {
    Box<BookEntity> favorite = Hive.box('favorite');
    await favorite.add(book);
  }
}
