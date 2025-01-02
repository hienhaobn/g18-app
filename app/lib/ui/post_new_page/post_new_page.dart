import 'package:app/base/base_get_view.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/styles.dart';
import 'package:app/ui/post_new_page/post_new_page_controller.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/one_layout.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/two_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostNewPage extends BaseGetWidget<PostNewPageController> {
  const PostNewPage({super.key});

  @override
  PostNewPageController get controller => Get.put(PostNewPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: Obx(
          ()=> GestureDetector(
              onTap: (controller.currentStep.value == 0) ? () {
                Get.back();
              } : (){
                controller.onBackStep();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.border),
                child: Icon(
                 (controller.currentStep.value == 0) ? Icons.close : Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              )),
        ),
        centerTitle: true,
        title: Text("Đăng tin",
            style: controller.fontController.currentFontStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.blackText)),
        actions: [
          Obx(
            ()=> Text(
              'Bước ${controller.currentStep.value + 1}/2',
              style: AppStyles.normalStyle,
            ),
          )
        ],
      ),
      body: TabBarView(
        controller: controller.tabController.value,
        physics: NeverScrollableScrollPhysics(),
        children: [
          OneLayout(),
          TwoLayout(),
        ],
      ),
    );
  }
}


