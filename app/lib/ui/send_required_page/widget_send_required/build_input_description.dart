import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/input_text.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';

class BuildInputDescription extends StatelessWidget {
  const BuildInputDescription({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNoneRequired(text: 'Mô tả'),
        InputText2(   
          textInputType: TextInputType.multiline,
          hintText: 'Nhập mô tả',
          controller: controller.descriptionController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          maxLines: null, // Cho phép xuống dòng khi nhập dài
        ),
        
      ],
    );
  }
}
