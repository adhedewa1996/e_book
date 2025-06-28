import 'package:dartz/dartz.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/data/model/detail_book/detail_book.dart';
import 'package:e_books/data/model/get_book/result.dart';
import 'package:e_books/data/sources/book.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/book.dart';

class BookRepositoryImpl extends BookRepository {
  @override
  Future<Either> detailBook({required String id}) async {
    final returnedData = await sl<BookServices>().detailBook(id);

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
  Future<Either> getBooks() async {
    final returnedData = await sl<BookServices>().getBooks();

    return returnedData.fold(
      (error) {
        return Left(error);
      },
      (data) {
        final list = List.from(data['results']).map((e) => Result.fromMap(e).toEntity()).toList();
        return Right(list);
      },
    );
  }

  @override
  Future<Either> search() {
    // TODO: implement search
    throw UnimplementedError();
  }
}
