import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  // Hàm để nạp các file JSON từ tài nguyên
  Future<Map<String, Map<String, String>>> loadTranslations() async {
    // Lấy nội dung của các file JSON từ tài nguyên
    String enJson = await rootBundle.loadString('assets/lang/en.json');
    String viJson = await rootBundle.loadString('assets/lang/vi.json');

    // Chuyển đổi từ String thành Map
    Map<String, String> enMap = Map<String, String>.from(json.decode(enJson));
    Map<String, String> viMap = Map<String, String>.from(json.decode(viJson));

    return {
      'en': enMap,
      'vi': viMap,
    };
  }

  // Nạp các bản dịch từ các file JSON khi khởi tạo
  @override
  Map<String, Map<String, String>> get keys => {};
}
