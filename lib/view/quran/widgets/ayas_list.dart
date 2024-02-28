import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import 'package:qurankarem/core/components/custom_text.dart';

// ignore: must_be_immutable
class AyasList extends StatelessWidget {
  AyasList({
    super.key,
    required this.index,
    required this.startAya,
  });

  int index;
  int startAya;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: quran.getVerseCount(index + 1),
        itemBuilder: (context, i) {
          return CustomText(text: quran.getVerse(index + 1, 1));
        },
      ),
    );
  }
}
