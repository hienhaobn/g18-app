// ignore_for_file: unnecessary_overrides

import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePageController extends BaseGetXController {
  late PersistentTabController tabController;
  RxInt selectedIndex = (-1).obs; // Khởi đầu với không tab nào được chọn.
//
  final refreshController = RefreshController();
  RxList<String> banerImage = <String>[].obs;
  RxInt indexBanner = 0.obs;

  @override
  void onInit() {
    super.onInit();
    banerImage.value = [
      'https://cdn.leonardo.ai/users/f80f0e12-9a8f-4a00-ac49-1ed6aa54d92f/generations/9579f1e3-a7cd-407d-9f23-b9ede1d66af3/Leonardo_Phoenix_09_a_vividly_colored_and_highly_detailed_3D_r_5.jpg?w=512',
      'https://cdn.leonardo.ai/users/cc5e51d8-282c-4d02-b7fd-2e13a2e2c743/generations/19a932af-3402-4159-8d71-991667427d13/variations/alchemyrefiner_alchemymagic_3_19a932af-3402-4159-8d71-991667427d13_0.jpg?w=512',
      'https://cdn.leonardo.ai/users/debc8b11-6a42-4242-87e9-653252ac5da1/generations/bbf22b8b-fa7d-4213-83c5-e829e5d16ce8/variations/alchemyrefiner_alchemymagic_1_bbf22b8b-fa7d-4213-83c5-e829e5d16ce8_0.jpg?w=512',
      'https://cdn.leonardo.ai/users/d4934203-8695-46c5-be1b-dd6fbe7d6543/generations/ca19cb8b-2646-4f20-9813-3c2e3cb8a1a7/variations/alchemyrefiner_alchemymagic_0_ca19cb8b-2646-4f20-9813-3c2e3cb8a1a7_0.jpg?w=512',
      'https://cdn.leonardo.ai/users/a3dd2cf3-9ff3-44c2-b81c-48d8e6fa9dc4/generations/3112fdb3-375d-47de-98a2-15a34b832b5a/Leonardo_Anime_XL_In_a_semireal_anime_style_in_the_heart_of_a_3.jpg?w=512',
    ];
  }
}
