import 'package:app/base/assets.dart';
import 'package:app/base/base_dropdown.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/flushbar.dart';
import 'package:app/base/fonts.dart';
import 'package:app/base/icons.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/ui/account_page/account_page_controller.dart';
import 'package:app/ui/account_page/widget_account_page/policy_screen.dart';
import 'package:app/ui/account_page/widget_account_page/profile_screen.dart';
import 'package:app/ui/account_page/widget_account_page/rules_screen.dart';
import 'package:app/ui/account_page/widget_account_page/user_manual_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SharedOfAccountPage extends StatelessWidget {
  const SharedOfAccountPage({super.key, required this.controller});
  final AccountPageController controller;
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildListItem(
            icon: IconPath.ic_introduce,
            text: 'Giới thiệu',
            onTap: () {
              Get.to(() => Profilescreen());
            },
          ),
          _buildListItem(
            icon: IconPath.ic_rules,
            text: 'Điều khoản',
            onTap: () {
              Get.to(() => RulesScreen());
            },
          ),
          _buildListItem(
            icon: IconPath.ic_policy,
            text: 'Chính sách',
            onTap: () {
              Get.to(() => PolicyScreen());
            },
          ),
          _buildListItem(
            icon: IconPath.ic_user_manual,
            text: 'Quy định chung',
            onTap: () {
              Get.to(() => UserManualScreen());
            },
          ),
          _buildListItem(
            icon: IconPath.ic_contact,
            text: 'Call/Zalo/Imess: 0948563993',
            onTap: () {
              showFlushBar(
                  content: 'Thông báo : Đang trong quá trình phát triển',
                  backgroundColor: AppColors.p4C28A5);
            },
          ),
          _buildListItem(
            // iconColor: AppColors.p4C28A5,
            useWithHeightIcon: true,
            icon: IconPath.ic_introduce,
            text: 'Chọn kiểu chữ',
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    height: 200,
                    color: Colors.white,
                    child: Column(
                      children: [
                        10.height,
                        Text(
                          'Chọn kiểu chữ',
                          style: controller.fontController.currentFontStyle,
                        ),
                        // TitleCloseWidget(title: 'Chọn kiểu chữ'),
                        10.height,
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.border),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: BuildDropDownV2<String>(
                                  currentValue: controller
                                      .fontController.selectedFontKey.value,
                                  childs: [
                                    DropdownMenuItem(
                                      value: 'inter',
                                      child: Text(
                                        'Inter',
                                        style: AppFonts.quicksan(
                                            color: controller
                                                        .fontController
                                                        .selectedFontKey
                                                        .value ==
                                                    'inter'
                                                ? Colors.red
                                                : Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'roboto',
                                      child: Text(
                                        'Roboto',
                                        style: AppFonts.roboto(
                                            color: controller
                                                        .fontController
                                                        .selectedFontKey
                                                        .value ==
                                                    'roboto'
                                                ? Colors.red
                                                : Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'lato',
                                      child: Text(
                                        'Lato',
                                        style: AppFonts.lato(
                                            color: controller
                                                        .fontController
                                                        .selectedFontKey
                                                        .value ==
                                                    'lato'
                                                ? Colors.red
                                                : Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'pacifico',
                                      child: Text(
                                        'Pacifico',
                                        style: AppFonts.pacifico(
                                            color: controller
                                                        .fontController
                                                        .selectedFontKey
                                                        .value ==
                                                    'pacifico'
                                                ? Colors.red
                                                : Colors.black),
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'quicksan',
                                      child: Text(
                                        'Quicksan',
                                        style: AppFonts.quicksan(
                                            color: controller
                                                        .fontController
                                                        .selectedFontKey
                                                        .value ==
                                                    'quicksan'
                                                ? Colors.red
                                                : Colors.black),
                                      ),
                                    ),
                                  ],
                                  hintText: 'Select Font',
                                  onChange: (value) {
                                    if (value != null) {
                                      controller.fontController
                                          .changeFont(value);
                                      Navigator.pop(context);
                                    }
                                  },
                                  // showClearIcon: false,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
      {required String icon,
      required String text,
      required VoidCallback onTap,
      Color? iconColor,
      bool? useWithHeightIcon = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Color(0xFFF4F4F4),
        ),
        margin: EdgeInsets.only(bottom: 12),
        child: Row(
          children: [
            // icon.svg(
            //     width: useWithHeightIcon == true ? 30 : 38,
            //     height: useWithHeightIcon == true ? 30 : 38,
            //     color: iconColor),
            AppAssets.svgIcon(icon, color: iconColor),
            6.width,
            Text(
              text,
              style: controller.fontController.currentFontStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333)),
            ),
          ],
        ),
      ),
    );
  }
}
