import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/usecases/get_books.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController with StateMixin<dynamic> {
  final listBooks = <BookEntity>[].obs;
  final isLoadmore = false.obs;
  final isCalled = false.obs;
  final isNoMore = false.obs;
  final nextPage = 1.obs;
  ScrollController? scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    getData(page: '$nextPage');
    super.onInit();
  }

  void onRefresh() {
    nextPage.value = 1;
    isLoadmore.value = false;
    getData(page: '${nextPage.value}');
    update();
  }

  Future<void> handleLoadmore() async {
    if (isNoMore.value) return;
    if (isCalled.value || isLoadmore.value) return;
    isLoadmore.value = true;
    update();
    await getData(page: '${nextPage.value}', loadmore: true);
    isLoadmore.value = false;
    isCalled.value = false;
    update();
  }

  Future<void> getData({required String page, bool loadmore = false}) async {
    isCalled.value = true;
    if (!loadmore) {
      change(null, status: RxStatus.loading());
    } else {
      isLoadmore.value = true;
    }
    update();
    final returnedData = await sl<GetBooksUseCase>().call(params: page);
    returnedData.fold(
      (error) {
        if (loadmore) {
          isLoadmore.value = false;
        }
        isCalled.value = false;
        change(error, status: RxStatus.error());
      },
      (data) {
        if (loadmore) {
          isLoadmore.value = false;
          isCalled.value = false;
          final bookAndPageEntity = data as BookAndPageEntity;
          listBooks.addAll(bookAndPageEntity.bookEntity);
          if (bookAndPageEntity.page == '0') {
            isNoMore.value = true;
          } else {
            nextPage.value = int.parse(bookAndPageEntity.page);
          }
          change(data, status: RxStatus.loadingMore());
        } else {
          isCalled.value = false;
          final bookAndPageEntity = data as BookAndPageEntity;
          listBooks.value = bookAndPageEntity.bookEntity;
          if (bookAndPageEntity.page == '0') {
            isNoMore.value = true;
          } else {
            nextPage.value = int.parse(bookAndPageEntity.page);
          }
          change(data, status: RxStatus.success());
        }
      },
    );
  }
}
