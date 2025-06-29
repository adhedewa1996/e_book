import 'package:e_books/domain/entities/book.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: one_member_abstracts
abstract class FavoriteRepository {
  Future<void> add(BookEntity book);
  Future<void> remove(BookEntity book);
  Box<BookEntity> getBooks();
}
