import 'package:app/base/bottom_button.dart';
import 'package:app/base/input_text.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/ui/account_page/widget_account_page/setting_infor_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({super.key});

  final SettingInforPageController controller =
      Get.put(SettingInforPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thay đổi mật khẩu',
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
            icon: Icon(Icons.arrow_back_ios_new, color: Colors.black, size: 24),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Thay đổi mật khẩu',
              style: controller.fontController.currentFontStyle
                  .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            10.height,
            //
            InputText(hintText: 'Nhập mật khẩu của bạn',
            iconSufix: Icon(Icons.visibility),
            ),
            10.height,
            //
            InputText(hintText: 'Nhập mật khẩu mới',
            iconSufix: Icon(Icons.visibility),
            ),
            10.height,//
            InputText(hintText: 'Xác nhận mật khẩu mới',
            iconSufix: Icon(Icons.visibility),
            ),
            15.height,
            BottomButton(onTap: (){
              print('Button Thay đổi của Thay đổi mật khẩu');
            }, title: 'Thay đổi')
          ],
        ),
      ),
    );
  }
}
