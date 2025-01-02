import 'package:app/base/fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FontController extends GetxController {
  // Default font key
  var selectedFontKey = 'lato'.obs;

  @override
  void onInit() {
    super.onInit();
    loadFontFromPrefs();
  }

  void changeFont(String fontKey) {
    selectedFontKey.value = fontKey;
    saveFontToPrefs(fontKey);
  }

  TextStyle get currentFontStyle {
    switch (selectedFontKey.value) {
      case 'roboto':
        return AppFonts.roboto();
      case 'quicksan':
        return AppFonts.quicksan();
      case 'pacifico':
        return AppFonts.pacifico();
       case 'inter':
        return AppFonts.inter();
      default:
        // return AppFonts.roboto();
        return AppFonts.lato();
    }
  }

  void saveFontToPrefs(String fontKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('selectedFont', fontKey);
  }

  void loadFontFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedFontKey.value = prefs.getString('selectedFont') ?? 'lato';
  }
}
