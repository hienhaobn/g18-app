import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingInforPageController extends BaseGetXController {
  final FontController fontController = Get.find<FontController>();

  RxString userId = ''.obs;
  RxString fullNameUser = ''.obs;
  RxString userDataEmail = ''.obs;
  //
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final birthdayController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    userId.value = '123456';
    fullNameUser.value = 'fullNameUser';
    userDataEmail.value = 'abcd@gmail.com';
    //
    fullNameController.text = 'fullName';
    emailController.text = 'asjfgf@gmail.com';
    phoneNumberController.text = '0123651623';
    birthdayController.text = '01/01/2025';

  }
}


 