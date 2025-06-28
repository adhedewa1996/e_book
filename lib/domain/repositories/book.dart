import 'package:dartz/dartz.dart';

// ignore: one_member_abstracts
abstract class BookRepository {
  Future<Either> search();
  Future<Either> getBooks();
  Future<Either> detailBook({required String id});
}
