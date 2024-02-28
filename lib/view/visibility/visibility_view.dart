import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qurankarem/view/visibility/widgets/play_quran_sound_button.dart';
import 'package:qurankarem/view/visibility/widgets/surah_index_button.dart';
import 'package:qurankarem/view/visibility/widgets/visibility_info_widget.dart';

// ignore: must_be_immutable
class VisibilityView extends StatefulWidget {
  VisibilityView({
    super.key,
    required this.surahNumber,
  });
  int surahNumber;

  @override
  State<VisibilityView> createState() => _VisibilityViewState();
}

class _VisibilityViewState extends State<VisibilityView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.25,
      width: Get.width,
      color: Colors.black.withOpacity(0.5),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              VisibilityInfoWidget(surahNumber: widget.surahNumber),
              const SizedBox(height: 12),
              const Divider(height: 2),
              const SizedBox(height: 12),
              SurshIndexButton(surahNumber: widget.surahNumber),
              const SizedBox(height: 12),
              const Divider(height: 2),
              const SizedBox(height: 12),
              PlayQuranSoundButton(surahNumber: widget.surahNumber),
            ],
          ),
        ),
      ),
    );
  }
}
