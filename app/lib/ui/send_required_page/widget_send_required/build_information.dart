import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/input_text.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';

class BuildInformation extends StatelessWidget {
  const BuildInformation({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextRequired(
          text: 'Họ và tên',
        ),
        InputTextVer2(
          hintText: 'Nhập họ và tên',
          hintStyle: AppStyles.titleStyleV2,
          controller: controller.fullNameController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
        ),
        12.height,
        TextRequired(
          text: 'Số điện thoại',
        ),
        InputTextVer2(
          textInputType: TextInputType.number,
          hintText: 'Nhập số điện thoại',
          hintStyle: AppStyles.titleStyleV2,
          controller: controller.phoneNumberController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
        ),
        12.height,
        TextRequired(
          text: 'Gmail',
        ),
        InputTextVer2(
          textInputType: TextInputType.number,
          hintText: 'Nhập gmail',
          hintStyle: AppStyles.titleStyleV2,
          controller: controller.emailController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
        ),
        20.height,
      ],
    );
  }
}
