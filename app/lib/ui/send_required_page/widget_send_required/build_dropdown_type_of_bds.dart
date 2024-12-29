import 'package:app/base_hieu/base_dropdown.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/model_hieu/label_model.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildDropdownTypeOfBDS extends StatelessWidget {
  const BuildDropdownTypeOfBDS({
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
          TextRequired(text: 'Loại hình BĐS'),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.border,
              border: Border.all(
                color:
                    controller.selectTypeBDSValidationError.value.isNotEmpty 
                    // ||
                    //         controller.selectTypeBDSValidationError.value != ""
                        ? Colors.red // Viền đỏ khi có lỗi
                        : AppColors.border, // Viền bình thường khi không có lỗi
              ),
            ),
            child: BuildDropDownV2<LabelModal>(
              currentValue:
                  controller.selectedRealEstateType.value, // Đảm bảo kiểu đúng
              hintText: 'Chọn loại hình BĐS',
              onChange: (value) {
                controller.selectedRealEstateType.value = value;
                controller.selectedRealEstateType.refresh();
                // print (value?.value ?? '');
                controller.selectTypeBDSController.value.text =
                    value?.label ?? '';
                controller.validateSelectTypeBDS();
                print(value?.value ?? '');
              },

              childs: controller.typeBDSOptions
                  .map<DropdownMenuItem<LabelModal>>(
                    (type) => DropdownMenuItem<LabelModal>(
                      value: type,
                      child: Text(
                        type.label ?? '', // Đảm bảo `type.label` là kiểu String
                        style: AppStyles.contentStyleV2,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          if (controller.selectTypeBDSValidationError.value.isNotEmpty
          //  ||
          //     controller.selectedRealEstateType.value?.value == null
              )
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                controller.selectTypeBDSValidationError.value,
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


 //  controller
                //         .typeBDSController.value.text.isEmpty
                //     ? const SizedBox
                //         .shrink() // Không hiển thị Dropdown nếu chưa chọn Loại BĐS
                //     :
