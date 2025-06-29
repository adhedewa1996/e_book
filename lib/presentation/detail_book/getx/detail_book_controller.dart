import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/usecases/get_detail_book.dart';
import 'package:get/get.dart';

class DetailBooksController extends GetxController with StateMixin<dynamic> {
  final String id;
  DetailBooksController({required this.id});

  late BookEntity? book;

  @override
  void onInit() {
    getData(id: id);
    super.onInit();
  }

  Future<void> getData({required String id}) async {
    change(null, status: RxStatus.loading());
    final returnedData = await sl<GetDetailBookUseCase>().call(params: id);
    returnedData.fold(
      (error) {
        change(error, status: RxStatus.error());
      },
      (data) {
        book = data as BookEntity;
        change(data, status: RxStatus.success());
      },
    );
    update();
  }
}
