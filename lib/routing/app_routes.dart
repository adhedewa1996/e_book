abstract class Routes {
  Routes._();
  static const dashboard = _Paths.dashboard;
  static const home = _Paths.home;
  static const favorites = _Paths.favorites;
  static const detailBook = _Paths.detailBook;
  static const search = _Paths.search;
  static const readingMode = _Paths.readingMode;
}

abstract class _Paths {
  _Paths._();
  static const dashboard = '/';
  static const home = '/home';
  static const favorites = '/favorites';
  static const detailBook = '/detail-book';
  static const search = '/search';
  static const readingMode = '/readingMode';
}
