import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
// import 'package:app/base_hieu/handle_error.dart';

class HomePageController extends BaseGetXController {
  late PersistentTabController tabController;
  RxInt selectedIndex = (1).obs; // Khởi đầu với không tab nào được chọn.


  @override
  void onInit() {
    super.onInit();
    // tabController = PersistentTabController(initialIndex: 2);
  }

  // void setSelectedIndex(int index) {
  //   selectedIndex.value = index;
  // }
}
