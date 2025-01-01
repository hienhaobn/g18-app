import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:get/get.dart';

class AccountPageController extends BaseGetXController {
  final FontController fontController = Get.find<FontController>();

  RxString userName = ''.obs;
  RxString userAddress = ''.obs;
  RxString userRank = ''.obs;

  @override
  void onInit() {
    super.onInit();

    userName.value = 'anmeUser';
    userAddress.value = 'Thanh xuân';
    userRank.value = 'Vàng';
  }
}
