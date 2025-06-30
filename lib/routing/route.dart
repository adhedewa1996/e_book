import 'package:e_books/data/model/search.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/presentation/audio_book_mode/getx/audio_book_binding.dart';
import 'package:e_books/presentation/dashboard/dashboard.dart';
import 'package:e_books/presentation/detail_book/detail_book.dart';
import 'package:e_books/presentation/detail_book/getx/detail_book_binding.dart';
import 'package:e_books/presentation/favorites/favorites.dart';
import 'package:e_books/presentation/favorites/getx/favorite_binding.dart';
import 'package:e_books/presentation/home/getx/home_binding.dart';
import 'package:e_books/presentation/home/home.dart';
import 'package:e_books/presentation/reading_mode/getx/reading_mode_binding.dart';
import 'package:e_books/presentation/reading_mode/reading_mode.dart';
import 'package:e_books/presentation/search/getx/search_binding.dart';
import 'package:e_books/presentation/search/search.dart';
import 'package:e_books/presentation/search/search_result.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'app_routes.dart';

GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: Routes.dashboard,
      builder: (BuildContext context, GoRouterState state) {
        return Dashboard();
      },
    ),
    GoRoute(
      path: Routes.home,
      builder: (BuildContext context, GoRouterState state) {
        return Home();
      },
    ),
    GoRoute(
      path: Routes.favorites,
      builder: (BuildContext context, GoRouterState state) {
        return Favorites();
      },
    ),
    GoRoute(
      path: '/detail-book/:id',
      builder: (BuildContext context, GoRouterState state) {
        final id = state.pathParameters['id'] ?? '';
        DetailBookBinding(id: id).dependencies();
        return DetailBook();
      },
    ),
    GoRoute(
      path: Routes.readingMode,
      builder: (BuildContext context, GoRouterState state) {
        final book = state.extra as BookEntity;
        return ReadingMode(bookEntity: book);
      },
    ),
    GoRoute(
      path: Routes.search,
      builder: (BuildContext context, GoRouterState state) {
        return Search();
      },
    ),
    GoRoute(
      path: '/search-result/:page/:keyword',
      builder: (BuildContext context, GoRouterState state) {
        final page = state.pathParameters['page'] ?? '';
        final keyword = state.pathParameters['keyword'] ?? '';
        final search = SearchModel(page: page, keyword: keyword);
        SearchBinding(search: search).dependencies();
        return SearchResult(search: search);
      },
    ),
  ],
  redirect: (context, state) {
    final path = state.uri.path;
    AudioBookBinding().dependencies();
    if (path == Routes.dashboard) {
      HomeBinding().dependencies();
      FavoriteBinding().dependencies();
    }
    if (path == Routes.readingMode) {
      ReadingModeBinding().dependencies();
    }
    return path;
  },
);
