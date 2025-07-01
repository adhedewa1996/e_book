import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController with StateMixin<dynamic>, GetSingleTickerProviderStateMixin {
  final currentIndex = 0.obs;
  final widthHelper = Rxn<double?>();
  TabController? controller;

  @override
  void onInit() {
    controller = TabController(length: 2, vsync: this);
    controller?.addListener(listener);
    super.onInit();
  }

  void listener() {
    setIndex(controller?.index ?? 0);
  }

  void setIndex(int value) async {
    currentIndex.value = value;
    controller?.animateTo(
      value,
      duration: Duration(seconds: 3), //
      curve: Curves.fastEaseInToSlowEaseOut,
    );
    widthHelper.value = Get.width * .3;
    await Future.delayed(Duration(milliseconds: 350));
    widthHelper.value = null;
  }
}
