import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurankarem/controller/splash_controller.dart';
import 'package:qurankarem/core/constants/assets.dart';

// ignore: must_be_immutable
class SplashView extends StatelessWidget {
  SplashView({super.key});
  SplashController controller = Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(builder: (controller) {
      return Scaffold(
        body: Container(
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.assetsImagesBackgroun),
              fit: BoxFit.fill,
            ),
          ),
          child: CircleAvatar(
            radius: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  Assets.assetsImagesSplash,
                  fit: BoxFit.cover,
                )),
          ),
        ),
      );
    });
  }
}
