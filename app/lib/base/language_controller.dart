import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class LanguageController extends GetxController {
  // Tạo một biến để lưu trữ ngôn ngữ hiện tại
  final _storage = GetStorage();
  RxString currentLanguage = 'en'.obs;

  @override
  void onInit() {
    super.onInit();
    // Kiểm tra và lấy ngôn ngữ đã lưu trong GetStorage
    currentLanguage.value = _storage.read('language') ?? 'en';
  }

  // Hàm thay đổi ngôn ngữ
  void changeLanguage(String languageCode) {
    currentLanguage.value = languageCode;
    _storage.write('language', languageCode);
    if (languageCode == 'en') {
      Get.updateLocale(Locale('en', 'US'));
    } else if (languageCode == 'vi') {
      Get.updateLocale(Locale('vi', 'VN'));
    }
  }
}
