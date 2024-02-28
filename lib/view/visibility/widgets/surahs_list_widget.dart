import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurankarem/controller/quran_home_controller.dart';
import 'package:qurankarem/controller/visibility_controller.dart';
import 'package:qurankarem/core/components/custom_text.dart';
import 'package:qurankarem/core/constants/app_color.dart';
import 'package:quran/quran.dart' as quran;

// ignore: must_be_immutable
class SurahsListWidget extends StatefulWidget {
  SurahsListWidget({super.key, this.surahNumber});
  int? surahNumber;

  @override
  State<SurahsListWidget> createState() => _SurahsListWidgetState();
}

class _SurahsListWidgetState extends State<SurahsListWidget> {
  @override
  void initState() {
    getAllSurahsNamesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: quran.totalSurahCount,
                itemBuilder: (context, index) {
                  final surahState = quran.getPlaceOfRevelation(index + 1);
                  final page = quran.getPageNumber(index + 1, 1);
                  return ListTile(
                    selected: true,
                    autofocus: true,
                    titleAlignment: ListTileTitleAlignment.center,
                    trailing: CustomText(
                      text: quran.getSurahNameArabic(index + 1),
                      fontSize: 24,
                    ),
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        switchSurahPlaceImage(surahState),
                        switchSurahPlaceString(surahState, darkColor),
                      ],
                    ),
                    onTap: () {
                      Get.back();
                      jumpToPageFromIndex(
                        page,
                      );
                      //setState(() {});
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
