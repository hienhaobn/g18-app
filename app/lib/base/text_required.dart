
import 'package:app/base/colors.dart';
import 'package:app/base/font_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextRequired extends StatelessWidget {
  final String text;
  final bool isRequired;
   TextRequired({super.key, required this.text, this.isRequired = true});

      final FontController fontController = Get.put(FontController());

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: text,
          style: fontController.currentFontStyle.copyWith(fontWeight: FontWeight.w500)
          ,
          children: [
            TextSpan(
                text: isRequired ? " *" : '',
                style: fontController.currentFontStyle.copyWith(color: AppColors.red)
                )
          ]),
    );
  }
}

class TextNoneRequired extends StatelessWidget {
  final String text;
   TextNoneRequired({super.key, required this.text});
      final FontController fontController = Get.put(FontController());


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:fontController.currentFontStyle.copyWith(fontWeight: FontWeight.w500)
    );
  }
}
