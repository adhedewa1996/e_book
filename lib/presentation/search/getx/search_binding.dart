import 'package:e_books/data/model/search.dart';
import 'package:e_books/presentation/search/getx/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {
  final SearchModel search;

  SearchBinding({required this.search});

  @override
  void dependencies() {
    Get.lazyPut(() => SearchBookController(search: search));
  }
}
