import 'package:app/base_hieu/base_get_view.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:app/ui/post_new_page/post_new_page_controller.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/one_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostNewPage extends BaseGetWidget<PostNewPageController> {
  const PostNewPage({super.key});

   @override
  PostNewPageController get controller =>
      Get.put(PostNewPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        elevation: 0,
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColors.border),
              child: Icon(
                Icons.close,
                color: Colors.black,
              ),
            )),
        centerTitle: true,
        title: Text("Đăng tin", 
            style: controller.fontController.currentFontStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: AppColors.blackText)
            ),
            actions: [
              Text('Bước 1/2',style: AppStyles.normalStyle,)
            ],
      ),
      body: TabBarView(
            controller: controller.tabController,
            physics: NeverScrollableScrollPhysics(),
            children: [
          OneLayout(),
          OneLayout(),
             
            ],
          ),
    );
  }
}
