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
  final scrollController = ScrollController().obs;

  @override
  void onInit() {
    getData(page: '$nextPage');
    super.onInit();
  }

  void onRefresh() {
    nextPage.value = 1;
    isLoadmore.value = false;
    getData(page: '${nextPage.value}');
  }

  void backToTop() {
    scrollController.value.animateTo(0, duration: Duration(seconds: 2), curve: Curves.linear);
  }

  Future<void> handleLoadmore() async {
    if (isNoMore.value) return;
    if (isCalled.value || isLoadmore.value) return;
    isLoadmore.value = true;
    await getData(page: '${nextPage.value}', loadmore: true);
    isLoadmore.value = false;
    isCalled.value = false;
  }

  Future<void> getData({required String page, bool loadmore = false}) async {
    isCalled.value = true;
    if (!loadmore) {
      change(null, status: RxStatus.loading());
    } else {
      isLoadmore.value = true;
    }
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
          final bookAndPageEntity = data;
          listBooks.addAll(bookAndPageEntity.bookEntity);
          if (bookAndPageEntity.page == '0') {
            isNoMore.value = true;
          } else {
            nextPage.value = int.parse(bookAndPageEntity.page);
          }
          change(data, status: RxStatus.loadingMore());
        } else {
          isCalled.value = false;
          final bookAndPageEntity = data;
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
