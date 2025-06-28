import 'package:dartz/dartz.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/favorite.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoriteRepositoryImpl extends FavoriteRepository {
  @override
  Future<Either> addToFavorite({required BookEntity bookEntity}) {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }

  @override
  Future<Either> getbooks({required BookEntity bookEntity}) {
    // TODO: implement getbooks
    throw UnimplementedError();
  }

  @override
  Future<Either> removeToFavorite({required BookEntity bookEntity}) {
    // TODO: implement removeToFavorite
    throw UnimplementedError();
  }

  @override
  Future<Box<BookEntity>> register() async {
    return await Hive.openBox<BookEntity>('favorite');
  }
}
