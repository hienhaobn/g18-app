import 'package:app/base/colors.dart';
import 'package:app/base/convert_value_2.dart';
import 'package:app/base/custom_input_field_money.dart';
import 'package:app/base/styles.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildInputCost extends StatelessWidget {
  const BuildInputCost({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => MoneyInputField(
        padding: EdgeInsets.symmetric(horizontal: 10),
        fillColor: AppColors.border,
        label: "Nhập tài chính",
        priceLable: ( formatStringToMoneyNumber(formatNumberPriceFromString(controller.inputValueCost.value)) != "0") ?
            formatStringToMoneyNumber(formatNumberPriceFromString(controller.inputValueCost.value)) : '',
        controller: controller.selectedPriceController,
        hintText: "Nhập tài chính",
          hintStyle: AppStyles.titleStyleV2,           
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Tài chính không được để trống';
          }
          return null;
        },
        onChanged: (value) {
          controller.inputValueCost.value = value.trim();
        }
      ),
    );
  }
}

 // controller
        //     .fontController.currentFontStyle
        //     .copyWith(
        //         color:
        //             AppColors.n777777.withOpacity(0.7)),