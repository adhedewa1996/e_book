import 'package:e_books/modules/dashboard/dashboard.dart';
import 'package:e_books/modules/detail_book/detail_book.dart';
import 'package:e_books/modules/favorites/favorites.dart';
import 'package:e_books/modules/home/home.dart';
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
      path: Routes.detailBook,
      builder: (BuildContext context, GoRouterState state) {
        return DetailBook();
      },
    ),
  ],
  // redirect: (context, state) {
  //   final path = state.uri.path;
  //   if (path == Routes.home) {
  //     // HomeBinding().dependencies();
  //   }
  //   return path;
  // },
);
