import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/recently_read.dart';
import 'package:hive/hive.dart';

abstract class RecentlyReadServices {
  Future<void> register();
  Future<void> put(BookEntity book);
  Future<Box<BookEntity>> getBooks();
}

class RecentlyReadServicesImpl extends RecentlyReadServices {
  @override
  Future<void> register() async {
    await Hive.openBox<BookEntity>('recenly_read');
  }

  @override
  Future<Box<BookEntity>> getBooks() async {
    final list = sl<RecentlyReadRepository>().getBooks();
    return list;
  }

  @override
  Future<void> put(BookEntity book) async {
    await sl<RecentlyReadRepository>().put(book);
  }
}
