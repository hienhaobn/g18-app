import 'package:app/base/base_dropdown.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/const.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/base/text_required.dart';
import 'package:app/model/label_model.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildDropDownDirection extends StatelessWidget {
  const BuildDropDownDirection({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextNoneRequired(text: 'Hướng'),
          Container(
            padding:
                const EdgeInsets.only(left: 15, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.border,
            ),
            child: BuildDropDownV2<LabelModal>(
              hintText: 'Chọn hướng',
              currentValue:
                  controller.selectedDirection.value,
              onChange: (value) {
                controller.selectedDirection.value = value;
              },
              childs: LABEL_DIRECTRION.map((label) {
                return DropdownMenuItem<LabelModal>(
                  value: label,
                  child: Text(label.label ?? ''),
                );
              }).toList(),
            ),
          ),
          12.height
        ],
      );
    });
  }
}