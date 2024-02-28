import 'package:flutter/material.dart';
import 'package:qurankarem/controller/visibility_controller.dart';
import 'package:quran/quran.dart' as quran;
import 'package:qurankarem/core/components/custom_text.dart';
import 'package:qurankarem/core/constants/app_color.dart';

// ignore: must_be_immutable
class VisibilityInfoWidget extends StatefulWidget {
  VisibilityInfoWidget({
    super.key,
    required this.surahNumber,
  });

  int surahNumber;

  @override
  State<VisibilityInfoWidget> createState() => _VisibilityInfoWidgetState();
}

class _VisibilityInfoWidgetState extends State<VisibilityInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        switchSurahPlaceString(
            quran.getSurahNameArabic(widget.surahNumber), whiteColor),
        const SizedBox(width: 12),
        switchSurahPlaceImage(
          quran.getPlaceOfRevelation(widget.surahNumber),
        ),
        const SizedBox(width: 12),
        CustomText(
          text: 'سورة ${quran.getSurahNameArabic(widget.surahNumber)}',
          color: whiteColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(width: 12),
      ],
    );
  }
}
