
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/input_text.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';

class BuildInputAcreage extends StatelessWidget {
  const BuildInputAcreage({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNoneRequired(text: 'Diện tích (m²)',),
        InputTextVer2(
          hintText: 'Nhập diện tích (m²)',
          hintStyle: AppStyles.titleStyleV2,
          controller: controller.acreageController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
        ),
      ],
    );
  }
}
