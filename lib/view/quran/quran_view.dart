import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:qurankarem/controller/quran_home_controller.dart';
import 'package:qurankarem/core/constants/assets.dart';
import 'package:qurankarem/view/visibility/visibility_view.dart';
import 'package:quran/quran.dart' as quran;

// ignore: must_be_immutable
class QuranView extends StatefulWidget {
  const QuranView({super.key});

  @override
  State<QuranView> createState() => _QuranViewState();
}

class _QuranViewState extends State<QuranView> {
  @override
  initState() {
    pageController = PageController();
    initialQuranList();
    getPage();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return PageView.builder(
      controller: pageController,
      reverse: true,
      itemCount: quran.totalPagesCount,
      itemBuilder: (context, index) {
        final int surahNumber = quran.getPageData(index + 1)[0]['surah'];
        return Scaffold(
            body: SafeArea(
          child: GestureDetector(
            onTap: () {
              changeVisibility();
              setState(() {});
            },
            child: Stack(
              children: [
                SizedBox(
                  height: height,
                  width: width,
                  child: quranList.isNotEmpty
                      ? Image.asset(
                          quranList[index],
                          fit: BoxFit.fill,
                          height: Get.height,
                          width: Get.width,
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: true,
                          child: index == initialPage
                              ? Padding(
                                  padding: EdgeInsets.only(left: 24.w),
                                  child:
                                      SvgPicture.asset(Assets.assetsImagesMark),
                                )
                              : Container(),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isVisible,
                      child: VisibilityView(
                        surahNumber: surahNumber,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ));
      },
      onPageChanged: (value) {
        savePage(value);
      },
    );
  }
}
