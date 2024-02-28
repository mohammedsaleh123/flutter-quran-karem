import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurankarem/core/components/custom_text.dart';
import 'package:quran/quran.dart' as quran;

// ignore: must_be_immutable
class CustomAppBarWidget extends StatelessWidget {
  CustomAppBarWidget({
    super.key,
    required this.surahNumber,
  });

  int surahNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      height: Get.height * 0.09,
      width: Get.width,
      child: CustomText(
        text: quran.getSurahNameArabic(surahNumber),
        fontWeight: FontWeight.bold,
        fontSize: 28,
      ),
    );
  }
}
