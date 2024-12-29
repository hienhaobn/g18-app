import 'package:app/base_hieu/base_dropdown.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildDropdownTypeBDS extends StatelessWidget {
  const BuildDropdownTypeBDS({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRequired(text: 'Loại BĐS'),
          Container(
            padding: EdgeInsets.only(left: 15, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.border,
              border: Border.all(
                color: controller.typeBDSValidationError.value.isNotEmpty
                    ? Colors.red // Viền đỏ khi có lỗi
                    : AppColors.border, // Viền bình thường khi không có lỗi
              ),
            ),
            child: BuildDropDownV2<String>(
              currentValue: controller.typeBDSController.value.text.isNotEmpty
                  ? controller.typeBDSController.value.text
                  : null,
              hintText: 'Chọn loại BĐS',
              onChange: (value) {

                controller.typeBDSController.value.text = value ?? '';
                controller.typeBDSController.refresh();
                controller.selectedRealEstateType.value =
                    null; // Đặt lại danh sách loại hình BĐS
                controller.updateTypeBDSOptions(
                    value); // Cập nhật danh sách loại hình BĐS
                // print (value);
                controller.validateTypeBDS(); // Kiểm tra điều kiện
              },
              childs: lstAirline2
                  .map<DropdownMenuItem<String>>(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Text(
                        airlineNames2[type] ?? '',
                        style: AppStyles.contentStyleV2,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          if (controller.typeBDSValidationError.value.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                controller.typeBDSValidationError.value,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
