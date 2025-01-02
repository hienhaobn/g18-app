import 'package:app/base/colors.dart';
import 'package:app/base/const.dart';
import 'package:app/base/styles.dart';
import 'package:app/base/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildConfirmIdentity extends StatelessWidget {
  const BuildConfirmIdentity({super.key, required this.controller});

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.s0ADBDB),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextRequired(
              text: 'Xác nhận định danh',
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(ListXacNhanDinhDanh.length, (index) {
                  return Obx(() {
                    return Row(
                      children: [
                        Checkbox(
                          value: index == 0
                              ? controller.isCustomerSelected.value
                              : controller.isAgencySelected.value,
                          onChanged: (bool? value) {
                            if (index == 0) {
                              controller.toggleCustomer();
                            } else {
                              controller.toggleAgency();
                            }
                          },
                        ),
                        Text(ListXacNhanDinhDanh[index].label ?? ''),
                      ],
                    );
                  });
                })),
            if (
                controller.valueCheckBox.value.isEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 5),
                child: Text(
                  'Vui lòng chọn',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
