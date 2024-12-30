import 'package:app/base_hieu/base_dropdown.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/ui/post_new_page/post_new_page_controller.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/build_bropdown_type_bds.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/build_dropdown_nhaucau.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/build_dropdown_type_of_bds.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/section_column.dart';
import 'package:app/ui/post_new_page/widget_post_new_page/widget_dropdown_type_bds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneLayout extends StatelessWidget {
  OneLayout({super.key});

  final PostNewPageController controller = PostNewPageController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          SectionColumn(
              label: "Thông tin cơ bản", child: _informationProject()),
        ],
      ),
    ));
  }

  Widget _informationProject() {
    return Obx(
      () => Column(
        children: [
          10.height,
          //nhu cầu đăng tin
          BuildDropdownNhucau(controller: controller),

          10.height,
          //loại bđs
          BuildDropdownTypeBDS(
            controller: controller,
          ),

          10.height,
          //loại hình bđs
          BuildDropdownTypeOfBDS(controller: controller)

          //hình ảnh - video - var 360
          // UploadFileWidget(
          //   initIVideo: _cubit.filesVideo,
          //   initImage: _cubit.filesImage,
          //   initImage360: _cubit.filesImage360,
          //   onCallBack: _cubit.uploadFile,
          //   imageLinkController: _cubit.imageLinkController,
          //   videoLinkController: _cubit.videoLinkController,
          //   image360LinkController: _cubit.image360LinkController,
          // )
        ],
      ),
    );
  }
}


