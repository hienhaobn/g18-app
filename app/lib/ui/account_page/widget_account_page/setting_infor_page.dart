import 'package:app/base_hieu/base_get_view.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/ui/account_page/widget_account_page/setting_infor_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingInforPage extends BaseGetWidget<SettingInforPageController> {
  const SettingInforPage({super.key});

  @override
  SettingInforPageController get controller =>
      Get.put(SettingInforPageController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(
            'Cài đặt',
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 150,
                color: Colors.blue[50],
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage:
                            AssetImage('assets/icons/g18iconAvata.jpg'),
                      ),
                      20.height,

                      Center(
                        child: Text(
                          "Thông tin cá nhân",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      )
                      // TextButton.icon(
                      //   onPressed: () {
                      //     // print(appStore.userDataDob);
                      //     clickChangeImage();
                      //   },
                      //   icon: Icon(Icons.camera_alt),
                      //   label: Text('Đổi ảnh đại diện'),
                      // ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: (){
                    // PersonalInfoScreen(),
                  },
                  child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow('Mã nhân viên', controller.userId.value),
                          _buildInfoRow(
                              'Họ và tên', controller.fullNameUser.value),
                          _buildInfoRow('Ngày sinh', '01/01/2025'
                              // '${formatStringToDate(appStore.userDataDob, "dd-MM-yyyy")}'
                              ),
                          _buildInfoRow('Số CCCD/HC', 'xxxxxxxxx'),
                          // _buildInfoRow('Loại giấy tờ', 'CCCD'),
                          // _buildInfoRow('Số CCCD/HC', '013658555931'),
                          _buildInfoRow('Email', controller.userDataEmail.value),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              _buildSettingItem(
                Icons.lock,
                'Đổi mật khẩu',
                () {
                  // AppRouter.router.push(NameRouter.ChangePasswordScreen.path);
                },
              ),
              // _buildSettingItem(Icons.privacy_tip, 'Bảo mật và quyền riêng tư',() {
              //   ShowToastSuss("Đang phát triển");
              // },),
              _buildSettingItem(
                Icons.payment,
                'Nạp tiền',
                () {
                  // ShowToastSuss("Đang phát triển");
                },
              ),

              _buildSettingItem(
                Icons.payment,
                'Xóa tài khoản',
                () {
                  // remoteAccount(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF4C28A5), // Màu tím #4C28A5
                        Color(0xFF0AAE84), // Màu xanh lá #0AAE84
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8), // Bo góc cho nút
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      // funtionlogout();
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          vertical: 16), // Khoảng cách trong nút
                      backgroundColor: Colors
                          .transparent, // Đặt nền của nút thành trong suốt
                      shadowColor: Colors.transparent, // Loại bỏ bóng
                      minimumSize: Size(double.infinity,
                          48), // Chiều cao nút và chiều rộng toàn màn hình
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bo góc nút
                      ),
                    ),
                    child: Text(
                      'Đăng xuất',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Màu chữ trắng
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 1,
            child: Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              overflow:
                  TextOverflow.ellipsis, // Hiển thị "..." nếu text quá dài
              maxLines: 1, // Giới hạn text trong 1 dòng
              textAlign: TextAlign.right, // Canh phải cho text "value"
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title, VoidCallback callback) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: callback, // Gọi callback khi nhấn vào item
    );
  }
}
