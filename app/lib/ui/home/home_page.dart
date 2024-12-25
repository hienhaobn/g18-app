import 'package:app/base_hieu/base_get_view.dart';
import 'package:app/ui/home/home_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/widget/custom_bottom_navigation.dart'; // Import the CustomBottomNavigation widget

class HomePage extends BaseGetWidget<HomePageController> {
  HomePage({Key? key}) : super(key: key);

  @override
  HomePageController get controller => Get.put(HomePageController());

  final List<Widget> _buildScreens = [
    Center(child: Text("Gửi yêu cầu")),
    Center(child: Text("Thuê BĐS")),
    Center(child: Text("Đăng tin")),
    Center(child: Text("Mua BĐS")),
    Center(child: Text("Tài khoản")),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomBottomNavigation(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            title: Text('Home'),
          ),
          body: _buildScreens[controller.selectedIndex.value],
        ),
      ),
    );
  }
}
