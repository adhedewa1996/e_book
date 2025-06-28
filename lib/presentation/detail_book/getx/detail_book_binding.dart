import 'package:e_books/presentation/detail_book/getx/detail_book_controller.dart';
import 'package:get/get.dart';

class DetailBookBinding extends Bindings {
  final String id;

  DetailBookBinding({required this.id});

  @override
  void dependencies() {
    Get.lazyPut(() => DetailBooksController(id: id));
  }
}
