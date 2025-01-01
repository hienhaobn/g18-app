import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:get/get.dart';

class SettingInforPageController extends BaseGetXController {
  final FontController fontController = Get.find<FontController>();

  RxString userId = ''.obs;
  RxString fullNameUser = ''.obs;
  RxString userDataEmail = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userId.value = '123456';
    fullNameUser.value = 'fullNameUser';
    userDataEmail.value = 'abcd@gmail.com';
  }
}


 