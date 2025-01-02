import 'package:app/base/assets.dart';
import 'package:app/base/icons.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/ui/account_page/account_page_controller.dart';
import 'package:app/ui/account_page/widget_account_page/community_renewal.dart';
import 'package:app/ui/account_page/widget_account_page/floor_management.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ManagerOfAccountPage extends StatelessWidget {
  const ManagerOfAccountPage({super.key, required this.controller});
  final AccountPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          // if (checkPermissionCEODIRECTOR() == true)
          Expanded(
            child: GestureDetector(
              onTap: () {
                // quanlysan();
                Get.to(()=>FloorManagement());
              },
              child: Container(
                padding:
                    EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color(0xFFDCFDFD),
                  border: Border.all(
                    width: 1,
                    color: Color(0xFF0ADBDB),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppAssets.svgIcon(IconPath.ic_setting),
                    8.height,
                    Text('Quản lý sàn',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: controller.fontController.currentFontStyle
                            .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333)) // primaryTextStyle(

                        ),
                  ],
                ),
              ),
            ),
          ),
          10.width,
          // if (checkPermissionCEODIRECTOR() == false) SizedBox(width: 12),
          Expanded(
            child: GestureDetector(
              onTap: () {
                // giahantincongodng();
                Get.to(() => CommunityRenewal());
              },
              child: Container(
                padding:
                    EdgeInsets.only(top: 12, bottom: 12, left: 10, right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Color(0xFFFFF5F8),
                  border: Border.all(
                    width: 1,
                    color: Color(0xFFB035DB),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Assets.icons.icCommunityExtension.svg(width: 38, height: 38),
                    AppAssets.svgIcon(IconPath.ic_community_extension),

                    8.height,
                    Text('Gia hạn cộng đồng',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: controller.fontController.currentFontStyle
                            .copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF333333))
                        // primaryTextStyle(
                        //   size: 16,
                        //   color: Color(0xFF333333),
                        //   weight: FontWeight.w600,
                        // ),

                        ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
