import 'package:app/base_hieu/assets.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/images.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/ui/account_page/account_page_controller.dart';
import 'package:app/ui/account_page/widget_account_page/setting_infor_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppbarAccountPage extends StatelessWidget {
  const AppbarAccountPage({super.key, required this.controller});

  final AccountPageController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        color: Colors.transparent,
        height: 180,
        child: Stack(
          children: [
            Container(
              child: AppAssets.pngImage(ImagePath.img_bg_appbar),
            ),
            Positioned(
              top: 50,
              left: 16,
              child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.white),
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 60,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Tài khoản',
                  style: controller.fontController.currentFontStyle.copyWith(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Positioned(
              top: 100,
              left: 16,
              right: 16,
              child: GestureDetector(
                onTap: () {
                  //thông tin cá nhân
                  print ('cài đặt tài khoản');
                  Get.to(()=> SettingInforPage());
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  height: 80,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          15.width,
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.red,
                          ),
                          10.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                controller.userName.value,
                                style: controller
                                    .fontController.currentFontStyle
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Khu vực: ',
                                    style: controller
                                        .fontController.currentFontStyle,
                                  ),
                                  Text(
                                    controller.userAddress.value,
                                    style: controller
                                        .fontController.currentFontStyle
                                        .copyWith(color: AppColors.s078D6B),
                                  )
                                ],
                              ),
                              2.height,
                              Container(
                                padding: EdgeInsets.only(left: 6, right: 6),
                                decoration: BoxDecoration(
                                  color: Color(0xFFFFF8DD),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0xFFFD822E),
                                  ),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // if (rankIcons.containsKey(rank))
                                    Image(
                                      image: AssetImage(rankIcons[
                                          controller.userRank.value]!),
                                      height: 15,
                                      width: 15,
                                    ),

                                    4.width,
                                    Text(
                                      controller.userRank.value,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          padding: EdgeInsets.only(
                              left: 13, right: 10, top: 10, bottom: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: AppColors.border),
                          child: Icon(Icons.arrow_forward_ios_rounded))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
