import 'package:app/base_hieu/base_dropdown.dart';
import 'package:app/base_hieu/bottom_button.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/convert_value.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:app/ui/account_page/widget_account_page/setting_infor_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityRenewal extends StatelessWidget {
  const CommunityRenewal({super.key});

  @override
  SettingInforPageController get controller =>
      Get.put(SettingInforPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'Gia hạn gói tin',
            style: controller.fontController.currentFontStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 18),
          ),
          backgroundColor: Color(0xFF4C28A5),
          centerTitle: true, // Đặt tiêu đề ở giữa
          leading: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF4F4F4),
              shape: BoxShape.circle,
            ),
            margin: EdgeInsets.only(left: 15),
            child: IconButton(
              icon:
                  Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 24),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Chọn gói gia hạn',
                style: controller.fontController.currentFontStyle
                    .copyWith(fontSize: 18),
              ),
              Container(
                padding: const EdgeInsets.only(left: 15, right: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.border,
                  border: Border.all(
                    color:
                        AppColors.border, // Viền bình thường khi không có lỗi
                  ),
                ),
                child: BuildDropDownV2<String>(
                  hintText: 'Chọn nhu cầu đăng tin',
                  stylehint:
                      AppStyles.titleStyleV2.copyWith(color: AppColors.white),
                  currentValue: controller.selectedValueRenewal.value.isNotEmpty
                      ? controller.selectedValueRenewal.value
                      : null,
                  onChange: (value) {
                    if (value != null) {
                      controller.selectedValueRenewal.value = value;
                    }
                  },
                  childs: DataRenewal.map<DropdownMenuItem<String>>(
                    (item) => DropdownMenuItem<String>(
                      value: item.value,
                      child: Text(item.label ?? ''),
                    ),
                  ).toList(),
                ),
              ),
              10.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng thanh toán',
                    style: controller.fontController.currentFontStyle
                        .copyWith(fontSize: 18),
                  ),
                  Text(
                    convertMoneytoStringDot2(controller.priceValue.value * int.parse(controller.selectedValueRenewal.value)),
                    style: controller.fontController.currentFontStyle
                        .copyWith(fontSize: 18, color: AppColors.red),
                  ),
                ],
              ),
              15.height,
              BottomButton(
                onTap: () {
                  //
                  print('Button thanh toán');
                },
                title: 'Thanh toán',
                buttonColor: Colors.cyan,
              )
            ],
          ),
        ),
      ),
    );
  }
}
