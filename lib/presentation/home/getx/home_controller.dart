import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/usecases/get_books.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  final listBooks = <BookEntity>[].obs;
  @override
  void onInit() {
    getData();
    super.onInit();
  }

  Future<void> getData() async {
    change(null, status: RxStatus.loading());
    final returnedData = await sl<GetBooksUseCase>().call();
    returnedData.fold(
      (error) {
        change(error, status: RxStatus.error());
      },
      (data) {
        listBooks.value = data;
        change(data, status: RxStatus.success());
      },
    );
  }
}
