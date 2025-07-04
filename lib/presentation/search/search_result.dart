import 'package:e_books/commons/extentions/media_query_ext.dart';
import 'package:e_books/commons/widgets/shadow_box.dart';
import 'package:e_books/core/config/constants/data_type.dart';
import 'package:e_books/core/config/theme/app_colors.dart';
import 'package:e_books/data/model/search.dart';
import 'package:e_books/presentation/search/getx/book/list_search_books.dart';
import 'package:e_books/presentation/search/getx/search_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SearchResult extends GetView<SearchBookController> {
  const SearchResult({
    super.key, //
    required this.search,
  });

  final SearchModel search;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          Get.delete<SearchBookController>();
        },
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: IconButton(
                onPressed: () {
                  context.pop();
                  Get.delete<SearchBookController>();
                },
                icon: Icon(
                  Icons.close_outlined,
                  size: 32,
                  color: Colors.black, //
                ),
              ),
            ),
            title: Text("Search Result", style: context.titleMedium),
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              controller.onRefresh();
            },
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification notification) {
                if ((controller.scrollController.value.position.pixels) > ((controller.scrollController.value.position.maxScrollExtent) * .98)) {
                  Get.find<SearchBookController>().handleLoadmore();
                }
                return false;
              },
              child: ListView(
                controller: controller.scrollController.value,
                padding: EdgeInsets.symmetric(horizontal: 8),
                shrinkWrap: true,
                children: [
                  ListSearchBook(
                    bookDetailType: BookDetailType.star,
                    header: Text(
                      '"${search.keyword}"', //
                      textAlign: TextAlign.center,
                      style: context.labelLarge,
                    ), //
                  ),
                  //
                ], //
              ),
            ),
          ), //
          floatingActionButton: Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: AppColors.darkMain,
              boxShadow: ShadowBox.normal(color: AppColors.whiteMain.withValues(alpha: 0.7)),
              borderRadius: BorderRadius.circular(100), //
            ),
            child: IconButton(
              onPressed: () {
                controller.backToTop();
              },
              icon: Icon(Icons.keyboard_arrow_up_rounded, color: AppColors.whiteMain), //
            ),
          ),
        ),
      );
    });
  }
}
