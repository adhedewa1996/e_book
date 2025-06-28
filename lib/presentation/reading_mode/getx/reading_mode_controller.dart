import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReadingModeController extends GetxController with StateMixin<dynamic> {
  ScrollController? scrollController;
  final offset = 0.0.obs;
  final bookHeight = 0.0.obs;
  final readPosition = 0.0.obs;
  final progress = 0.0.obs;
  final perinch = 0.0.obs;

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController?.addListener(setOffset);
    super.onInit();
  }

  void setOffset() {
    offset.value = scrollController?.offset ?? 0;
    bookHeight.value = scrollController?.position.maxScrollExtent ?? 0;
    if ((scrollController?.position.pixels ?? 0) > 0) {
      readPosition.value = scrollController?.position.pixels ?? 0;
    }
    progress.value = (readPosition.value / bookHeight.value).clamp(0.0, 1.0);
    perinch.value = bookHeight.value / Get.width;
  }

  @override
  void dispose() {
    super.dispose();
    scrollController?.dispose();
  }
}
