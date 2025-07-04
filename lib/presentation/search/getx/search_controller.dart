import 'package:e_books/core/dependency_injection/services_locator.dart';
import 'package:e_books/data/model/search.dart';
import 'package:e_books/domain/entities/book.dart';
import 'package:e_books/domain/usecases/search_books.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchBookController extends GetxController with StateMixin<dynamic> {
  final SearchModel search;
  SearchBookController({required this.search});

  final listBooks = <BookEntity>[].obs;
  final isLoadmore = false.obs;
  final isCalled = false.obs;
  final isNoMore = false.obs;
  final nextPage = 1.obs;
  final scrollController = ScrollController().obs;

  @override
  void onInit() {
    getData(search: search);
    super.onInit();
  }

  void onRefresh() {
    getData(search: search);
  }

  void backToTop() {
    scrollController.value.animateTo(0, duration: Duration(seconds: 2), curve: Curves.linear);
  }

  Future<void> handleLoadmore() async {
    if (isNoMore.value) return;
    if (isCalled.value || isLoadmore.value) return;
    isLoadmore.value = true;
    await getData(
      search: SearchModel(page: '$nextPage', keyword: search.keyword),
      loadmore: true,
    );
    isLoadmore.value = false;
    isCalled.value = false;
  }

  Future<void> getData({required SearchModel search, bool loadmore = false}) async {
    isCalled.value = true;
    if (!loadmore) {
      change(null, status: RxStatus.loading());
    } else {
      isLoadmore.value = true;
    }
    final returnedData = await sl<SearchBooksUseCase>().call(params: search);
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
