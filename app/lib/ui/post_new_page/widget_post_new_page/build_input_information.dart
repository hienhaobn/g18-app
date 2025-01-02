import 'package:app/base/colors.dart';
import 'package:app/base/input_text.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/base/styles.dart';
import 'package:app/base/text_required.dart';
import 'package:app/ui/post_new_page/post_new_page_controller.dart';
import 'package:flutter/material.dart';

class BuildInputInformation extends StatelessWidget {
  const BuildInputInformation({
    super.key,
    required this.controller,
  });

  final PostNewPageController controller;

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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Họ và tên không được để trống';
            }
            return null;
          },
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
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Số điện thoại không được để trống';
            }
            return null;
          },
        ),
        12.height,
        TextRequired(
          text: 'Gmail',
        ),
        InputTextVer2(
          hintText: 'Nhập gmail',
          hintStyle: AppStyles.titleStyleV2,
          controller: controller.emailController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Gmail không được để trống';
            }
            return null;
          },
        ),
        20.height,
      ],
    );
  }
}
