import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurankarem/controller/quran_home_controller.dart';
import 'package:qurankarem/core/components/custom_text.dart';
import 'package:qurankarem/core/constants/app_color.dart';
import 'package:qurankarem/view/visibility/widgets/surahs_list_widget.dart';

// ignore: must_be_immutable
class SurshIndexButton extends StatefulWidget {
  SurshIndexButton({
    super.key,
    required this.surahNumber,
  });
  int surahNumber;

  @override
  State<SurshIndexButton> createState() => _SurshIndexButtonState();
}

class _SurshIndexButtonState extends State<SurshIndexButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => SurahsListWidget(surahNumber: widget.surahNumber));

        changeVisibility();
        setState(() {});
      },
      child: Container(
        width: Get.width * 0.30,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: whiteColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomText(
              text: 'الفهرس',
              color: whiteColor,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(width: 12),
            Icon(
              Icons.menu_book,
              color: whiteColor,
            ),
          ],
        ),
      ),
    );
  }
}
