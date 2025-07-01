// 🔧 Create Mock with Mockito
import 'package:dartz/dartz.dart';
import 'package:e_books/core/network/app_client.dart';
import 'package:e_books/data/repositories/remote/book.dart';
import 'package:e_books/data/sources/remote/book.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/repositories/book.dart';
import 'package:e_books/domain/usecases/get_books.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

class MockBookRepository extends Mock implements BookRepository {}

class MockBookService extends Mock implements BookServices {}

void main() {
  final sl = GetIt.instance;
  late GetBooksUseCase usecase;

  setUp(() {
    sl.reset();
    sl.registerSingleton<AppClient>(AppClient());
    sl.registerSingleton<BookServices>(BookServicesImpl());
    sl.registerSingleton<BookRepository>(BookRepositoryImpl());
    sl.registerSingleton<GetBooksUseCase>(GetBooksUseCase());

    usecase = GetBooksUseCase();
  });

  test('Check response from GetBooksUseCase', () async {
    final response = await usecase.call(params: '1');
    expect(response, isA<Right<dynamic, BookAndPageEntity>>());
  });
}
