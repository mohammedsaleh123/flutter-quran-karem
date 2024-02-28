import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

PageController? pageController;
String dataBaseKey = 'page';
int initialPage = 0;
List quranList = [];
bool isVisible = false;

changeVisibility() {
  isVisible = !isVisible;
}

savePage(int index) async {
  final pref = await SharedPreferences.getInstance();
  pref.setInt(dataBaseKey, index);
}

getPage() async {
  final pref = await SharedPreferences.getInstance();
  initialPage = pref.getInt(dataBaseKey) ?? 0;
  pageController!.jumpToPage(
    initialPage,
  );
}

jumpToPageFromIndex(int page) {
  pageController!.animateToPage(
    page - 1,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOutCubicEmphasized,
  );
}

initialQuranList() {
  for (int i = 1; i < 605; i++) {
    String pageNumber = i.toString().padLeft(3, '0');
    String filename = "assets/quran_image/page$pageNumber.png";
    quranList.add(filename);
  }
}
