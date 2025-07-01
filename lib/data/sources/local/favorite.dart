import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/favorite.dart';
import 'package:hive/hive.dart';

abstract class FavoriteServices {
  Future<void> register();
  Future<void> add(BookEntity book);
  Future<void> remove(BookEntity book);
  Future<Box<BookEntity>> getBooks();
}

class FavoriteServicesImpl extends FavoriteServices {
  @override
  Future<void> register() async {
    await Hive.openBox<BookEntity>('favorite');
  }

  @override
  Future<void> add(BookEntity book) async {
    await sl<FavoriteRepository>().add(book);
  }

  @override
  Future<void> remove(BookEntity book) async {
    await sl<FavoriteRepository>().remove(book);
  }

  @override
  Future<Box<BookEntity>> getBooks() async {
    final list = sl<FavoriteRepository>().getBooks();
    return list;
  }
}
