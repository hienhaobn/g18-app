import 'package:app/base/base_dropdown.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/const.dart';
import 'package:app/base/styles.dart';
import 'package:app/base/text_required.dart';
import 'package:app/ui/post_new_page/post_new_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class BuildDropdownNhucau extends StatelessWidget {
  const BuildDropdownNhucau({
    super.key,
    required this.controller,
  });

  final PostNewPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextRequired(text: 'Nhu cầu đăng tin'),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.p4C28A5,
              border: Border.all(
                color: controller.selectTypeBDSValidationError.value.isNotEmpty
                    // ||
                    //         controller.selectTypeBDSValidationError.value != ""
                    ? Colors.red // Viền đỏ khi có lỗi
                    : AppColors.border, // Viền bình thường khi không có lỗi
              ),
            ),
            child: BuildDropDownV2<String>(
              hintText: 'Chọn nhu cầu đăng tin',
              colorsIconDrop: AppColors.white,
              stylehint: AppStyles.titleStyleV2.copyWith(color: AppColors.white),
              currentValue: controller.selectedValue.value.isNotEmpty
                  ? controller.selectedValue.value
                  : null,
              onChange: (value) {
                if (value != null) {
                  controller.selectedValue.value = value;
                }
              },
              childs: NHUCAUDANGTIN
                  .map<DropdownMenuItem<String>>(
                    (item) => DropdownMenuItem<String>(
                      value: item.value,
                      child: Text(item.label ?? ''),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
