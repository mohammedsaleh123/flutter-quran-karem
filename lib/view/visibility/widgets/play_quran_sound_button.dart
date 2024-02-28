import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurankarem/controller/visibility_controller.dart';
import 'package:qurankarem/core/components/custom_text.dart';
import 'package:qurankarem/core/constants/app_color.dart';
import 'package:quran/quran.dart' as quran;

class PlayQuranSoundButton extends StatefulWidget {
  const PlayQuranSoundButton({
    super.key,
    required this.surahNumber,
  });

  final int surahNumber;

  @override
  State<PlayQuranSoundButton> createState() => _PlayQuranSoundButtonState();
}

class _PlayQuranSoundButtonState extends State<PlayQuranSoundButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: Get.width * 0.1, left: Get.width * 0.1),
      child: MaterialButton(
        padding: const EdgeInsets.all(8),
        color: greyColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        onPressed: () {
          setState(() {
            switchPlaySound();
            playSound(
              quran.getAudioURLBySurah(widget.surahNumber),
            );
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isPlay ? Icons.pause : Icons.play_arrow,
              color: whiteColor,
            ),
            const SizedBox(width: 8),
            CustomText(
              text:
                  'استمع الي سورة ${quran.getSurahNameArabic(widget.surahNumber)}',
              color: whiteColor,
              fontSize: 18,
            ),
          ],
        ),
      ),
    );
  }
}
