import 'package:e_books/core/network/app_client.dart';
import 'package:e_books/data/repositories/book.dart';
import 'package:e_books/data/sources/book.dart';
import 'package:e_books/domain/repositories/book.dart';
import 'package:e_books/domain/usecases/get_books.dart';
import 'package:e_books/domain/usecases/get_detail_book.dart';
import 'package:e_books/domain/usecases/search_books.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class DependencyInjection {
  static void init() {
    // DIO CLIENT
    sl.registerSingleton<AppClient>(AppClient());

    // SERVICES
    sl.registerSingleton<BookServices>(BookServicesImpl());

    // REPOSITORIES
    sl.registerSingleton<BookRepository>(BookRepositoryImpl());

    // USECASES
    sl.registerSingleton<GetBooksUseCase>(GetBooksUseCase());
    sl.registerSingleton<GetDetailBookUseCase>(GetDetailBookUseCase());
    sl.registerSingleton<SearchBooksUseCase>(SearchBooksUseCase());
  }
}
