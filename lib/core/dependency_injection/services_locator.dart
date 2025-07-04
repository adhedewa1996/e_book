import 'package:e_books/core/network/app_client.dart';
import 'package:e_books/data/repositories/remote/book.dart';
import 'package:e_books/data/repositories/local/favorite.dart';
import 'package:e_books/data/repositories/local/recently_read.dart';
import 'package:e_books/data/sources/remote/book.dart';
import 'package:e_books/data/sources/local/favorite.dart';
import 'package:e_books/data/sources/local/_hive.dart';
import 'package:e_books/data/sources/local/recently_read.dart';
import 'package:e_books/domain/repositories/book.dart';
import 'package:e_books/domain/repositories/favorite.dart';
import 'package:e_books/domain/repositories/recently_read.dart';
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
    sl.registerSingleton<HiveServices>(HiveServicesImpl());
    sl.registerSingleton<FavoriteServices>(FavoriteServicesImpl());
    sl.registerSingleton<RecentlyReadServices>(RecentlyReadServicesImpl());

    // REPOSITORIES
    sl.registerSingleton<BookRepository>(BookRepositoryImpl());
    sl.registerSingleton<FavoriteRepository>(FavoriteRepositoryImpl());
    sl.registerSingleton<RecentlyReadRepository>(RecentlyReadRepositoryImpl());

    // USECASES
    sl.registerSingleton<GetBooksUseCase>(GetBooksUseCase());
    sl.registerSingleton<GetDetailBookUseCase>(GetDetailBookUseCase());
    sl.registerSingleton<SearchBooksUseCase>(SearchBooksUseCase());
  }
}
