import 'package:flutter/material.dart';
import 'package:qurankarem/core/components/custom_text.dart';
import 'package:qurankarem/core/constants/assets.dart';
import 'package:quran/quran.dart' as quran;
import 'package:just_audio/just_audio.dart';

List<String> allSurahNames = [];
AudioPlayer audioPlayer = AudioPlayer();
bool isPlay = false;
ScrollController? scrollController;
String saveAyaKey = 'aya';
int lastPage = 0;
int ayaNumber = 0;

//this function called when the app start
getAllSurahsNamesList() {
  allSurahNames.clear();
  for (int i = 1; i < 115; i++) {
    allSurahNames.add(quran.getSurahNameArabic(i));
  }
}

Widget switchSurahPlaceImage(String surahState) {
  return CircleAvatar(
    radius: 15,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image(
        image: AssetImage(
          surahState == 'Makkah'
              ? Assets.assetsImagesMakkah
              : Assets.assetsImagesMadenah,
        ),
        fit: BoxFit.fill,
      ),
    ),
  );
}

Widget switchSurahPlaceString(String surahState, Color color) {
  return CustomText(
    text: surahState == 'Makkah' ? 'مكية' : 'مدنية',
    fontSize: 20,
    color: color,
    fontWeight: FontWeight.bold,
  );
}

switchPlaySound() {
  isPlay = !isPlay;
}

playSound(String url) async {
  await audioPlayer.setUrl(url);
  if (isPlay == true) {
    audioPlayer.play();
  } else {
    await audioPlayer.stop();
  }
}
