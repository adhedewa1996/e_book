import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final scrollController = ScrollController().obs;
  final refreshQuote = true.obs;

  void onRefresh() {
    refreshQuote.value = !refreshQuote.value;
  }

  void backToTop() {
    scrollController.value.animateTo(0, duration: Duration(seconds: 2), curve: Curves.linear);
  }
}
