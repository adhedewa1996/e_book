import 'package:e_books/presentation/reading_mode/getx/reading_mode_controller.dart';
import 'package:get/get.dart';

class ReadingModeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReadingModeController());
  }
}
