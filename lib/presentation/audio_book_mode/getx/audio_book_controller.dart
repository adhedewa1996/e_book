import 'package:e_books/domain/entities/book.dart';
import 'package:get/get.dart';

class AudioBookController extends GetxController with StateMixin<dynamic> {
  final bottom = 0.0.obs;
  final left = 0.0.obs;
  final right = Rxn<double?>();
  final height = 0.0.obs;
  final width = 0.0.obs;
  final audioMode = 0.obs;
  final playAudio = true.obs;

  final delay = false.obs;

  late BookEntity bookEntity;

  void setBook(BookEntity book) {
    bookEntity = book;
  }

  void setAudioPlay(bool value) {
    playAudio.value = value;
  }

  void fullmode() async {
    if (!delay.value) {
      delay.value = true;
      bottom.value = Get.height * .14;
      left.value = Get.width * .1;
      right.value = Get.width * .1;
      height.value = 190;
      width.value = Get.width * .8;
      audioMode.value = 3;
      await Future.delayed(Duration(milliseconds: 700));
      delay.value = false;
    }
  }

  void smallmode({required bool reInit}) async {
    if (reInit) {
      setAudioPlay(true);
    }
    if (!delay.value) {
      delay.value = true;
      bottom.value = Get.height * .14;
      left.value = Get.width * .1;
      right.value = Get.width * .1;
      height.value = 132;
      width.value = Get.width * .8;
      audioMode.value = 2;
      await Future.delayed(Duration(milliseconds: 700));
      delay.value = false;
    }
  }

  void iconmode() async {
    if (!delay.value) {
      delay.value = true;
      bottom.value = Get.height * .14;
      left.value = (Get.width * .425);
      right.value = null;
      height.value = 55;
      width.value = 55;
      audioMode.value = 1;
      await Future.delayed(Duration(milliseconds: 700));
      delay.value = false;
    }
  }

  void removeAudioMode() {
    audioMode.value = 0;
    setAudioPlay(false);
  }
}
