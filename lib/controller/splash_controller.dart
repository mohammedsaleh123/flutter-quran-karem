import 'dart:async';
import 'package:get/get.dart';
import 'package:qurankarem/view/quran/quran_view.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    navigation();
    super.onInit();
  }

  navigation() {
    Timer(const Duration(seconds: 2), () {
      Get.off(
        () => const QuranView(),
        transition: Transition.leftToRight,
        duration: const Duration(seconds: 1),
      );
    });
    update();
  }
}
