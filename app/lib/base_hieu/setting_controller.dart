import 'package:app/base_hieu/color_controller.dart';
import 'package:app/base_hieu/data_demo.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:app/base_hieu/theme_controller.dart';
import 'package:app/main.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SettingController extends GetxController {
  RxInt selectedButtonIndex = RxInt(-1);
  final ColorController colorController = Get.find();
  final FontController fontController = Get.find<FontController>();
  final ThemeController themeController = Get.find<ThemeController>();

  RxString islanguage = ' '.obs;
  RxString isThemeMode = ' '.obs;
  final selectedQueue = Rx<QueueItem?>(null);
  final passengersTitleValue = Rx<String?>(null);
  Rx<String?> agencyStatus = Rx<String?>("SIGNED");

   TextEditingController controller = TextEditingController();
  final FocusNode focusNode = FocusNode();
  RxBool isShowIconClose = false.obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  void init() async {
    setLanguage();
    setThemeMode();
   controller.addListener(updateCloseIconVisibility);
  updateCloseIconVisibility();
  }

  void updateCloseIconVisibility() {
  
    isShowIconClose.value = controller.text.isNotEmpty;
 
}

  void setLanguage() {
    islanguage.value = prefs?.getString('language_code') ?? '';
  }

  void updateLanguage(String languageCode) async {
    await prefs?.setString('language_code', languageCode);
    islanguage.value = languageCode;
  }

  void setThemeMode() {
    isThemeMode.value = prefs?.getString('theme_mode') ?? '';
  }

  void updateThemeMode(String themeMode) async {
    await prefs?.setString('theme_mode', themeMode);
    isThemeMode.value = themeMode;
  }
}

  // void selectButton(int index) async {
  //   selectedButtonIndex.value = index;
  //   final prefs = await SharedPreferences.getInstance();
  //   await prefs.setInt('selectedButtonIndexLanguage', index);

  // }

  // islanguage =  prefs.getString('language_code') ?? 'en';

  // int? savedIndexlanguage = prefs.getInt('selectedButtonIndexLanguage');
  // selectedButtonIndex.value = savedIndexlanguage ?? -1;