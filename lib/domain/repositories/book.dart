import 'package:dartz/dartz.dart';
import 'package:e_books/data/model/search.dart';

// ignore: one_member_abstracts
abstract class BookRepository {
  Future<Either> search({required SearchModel search});
  Future<Either> getBooks({required String page});
  Future<Either> detailBook({required String id});
}
