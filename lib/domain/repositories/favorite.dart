import 'package:dartz/dartz.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:hive/hive.dart' show Box;

// ignore: one_member_abstracts
abstract class FavoriteRepository {
  Future<Box<BookEntity>> register();
  Future<Either> getbooks({required BookEntity bookEntity});
  Future<Either> addToFavorite({required BookEntity bookEntity});
  Future<Either> removeToFavorite({required BookEntity bookEntity});
}
