import 'package:dartz/dartz.dart';
import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/core/usecase/usecase.dart';
import 'package:e_books/domain/repositories/book.dart';

class SearchBooksUseCase extends UseCase<Either, dynamic> {
  @override
  // ignore: strict_raw_type, type_annotate_public_apis
  Future<Either> call({params}) async {
    // ignore: unnecessary_await_in_return
    return await sl<BookRepository>().search(search: params);
  }
}
