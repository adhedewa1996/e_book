import 'package:dartz/dartz.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/data/model/get_book/detail_book.dart';
import 'package:e_books/data/model/search.dart';
import 'package:e_books/data/sources/remote/book.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/book.dart';

class BookRepositoryImpl extends BookRepository {
  @override
  Future<Either<dynamic, BookAndPageEntity>> getBooks({required String page}) async {
    final returnedData = await sl<BookServices>().getBooks(page: page);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        bool isValid = false;
        Uri uri;
        if (data['next'] == null) {
          isValid = false;
          uri = Uri.parse('page=0');
        } else {
          uri = Uri.parse(data['next']);
          isValid = true;
        }
        final list = List.from(data['results']).map((e) => DetailBook.fromMap(e).toEntity()).toList();
        final bookAndPage = BookAndPageEntity(bookEntity: list, page: isValid ? (uri.queryParameters['page'] ?? '0') : '0');
        return Right(bookAndPage);
      },
    );
  }

  @override
  Future<Either<dynamic, BookEntity>> detailBook({required String id}) async {
    final returnedData = await sl<BookServices>().detailBook(id: id);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final book = DetailBook.fromMap(data).toEntity();
        return Right(book);
      },
    );
  }

  @override
  Future<Either<dynamic, BookAndPageEntity>> search({required SearchModel search}) async {
    final returnedData = await sl<BookServices>().search(search: search);

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        bool isValid = false;
        Uri uri;
        if (data['next'] == null) {
          isValid = false;
          uri = Uri.parse('page=0');
        } else {
          uri = Uri.parse(data['next']);
          isValid = true;
        }
        final list = List.from(data['results']).map((e) => DetailBook.fromMap(e).toEntity()).toList();
        final bookAndPage = BookAndPageEntity(bookEntity: list, page: isValid ? (uri.queryParameters['page'] ?? '0') : '0');
        return Right(bookAndPage);
      },
    );
  }
}
