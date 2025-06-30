import 'package:e_books/presentation/audio_book_mode/getx/audio_book_controller.dart';
import 'package:get/get.dart';

class AudioBookBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AudioBookController(), fenix: true);
  }
}
