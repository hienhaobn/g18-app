import 'package:app/ui/account_page/account_page_controller.dart';
import 'package:app/ui/account_page/widget_account_page/personal_report.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FloorManagement extends StatelessWidget {
  const FloorManagement({super.key});

    @override
  AccountPageController get controller =>
      Get.put(AccountPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Quản lý sàn',
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildItem(
              icon: Icons.person,
              color: Color(0xFF19173D),
              title: 'Báo cáo nhân sự',
              onTap: () {
                // Xử lý khi nhấn vào Nhân sự
                // AppRouter.router.push(NameRouter.Personnelmanagement.path);
                Get.to(()=>PersonalReport());
              },
            ),
            SizedBox(height: 16),
            _buildItem(
              icon: Icons.people,
              color: Color(0xFFF97700),
              title: 'Báo cáo hoạt động nhân sự',
              onTap: () {
                // AppRouter.router.push(NameRouter.salemanagement.path);
              },
            ),
            SizedBox(height: 16),
            _buildItem(
              icon: Icons.pie_chart,
              color: Color(0xFF078D6B),
              title: 'Báo cáo vận hành',
              onTap: () {
                // AppRouter.router.push(NameRouter.Baocaokdmanagement.path);
                // Xử lý khi nhấn vào Hoạt động kinh doanh
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildItem({
    required IconData icon,
    required Color color,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}