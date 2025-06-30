import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  ScrollController? scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
  }

  void backToTop() {
    scrollController?.animateTo(0, duration: Duration(seconds: 2), curve: Curves.linear);
  }
}
