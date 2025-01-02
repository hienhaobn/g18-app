
import 'package:app/base/colors.dart';
import 'package:app/base/input_text.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/base/styles.dart';
import 'package:app/base/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';

class BuildInputFacade extends StatelessWidget {
  const BuildInputFacade({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNoneRequired(text: 'Mặt tiền'),
        InputTextVer2(
          hintText: 'Nhập mặt tiền (m)',
          hintStyle: AppStyles.titleStyleV2,
          controller: controller.facadeController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
        ),
        12.height
      ],
    );
  }
}
