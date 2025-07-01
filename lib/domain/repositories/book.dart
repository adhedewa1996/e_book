import 'package:dartz/dartz.dart';
import 'package:e_books/data/model/search.dart';
import 'package:e_books/domain/entities/book.dart';

// ignore: one_member_abstracts
abstract class BookRepository {
  Future<Either<dynamic, BookAndPageEntity>> getBooks({required String page});
  Future<Either<dynamic, BookEntity>> detailBook({required String id});
  Future<Either<dynamic, BookAndPageEntity>> search({required SearchModel search});
}
