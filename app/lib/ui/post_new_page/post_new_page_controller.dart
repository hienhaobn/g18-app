import 'dart:convert';
import 'dart:io';

import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:app/model_hieu/label_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostNewPageController extends BaseGetXController with GetSingleTickerProviderStateMixin {
  final FontController fontController = Get.find<FontController>();

  late TabController tabController;
  final RxInt _currentStep = 0.obs;
  final typeBDSController = TextEditingController().obs;
  // Danh sách "Loại hình BĐS" dựa vào "Loại BĐS"
  RxList<LabelModal> typeBDSOptions = <LabelModal>[].obs;
  final Rx<LabelModal?> selectedRealEstateType = Rx<LabelModal?>(null);
   final typeBDSValidationError = ''.obs;
  final selectTypeBDSValidationError = ''.obs;
  final selectTypeBDSController = TextEditingController().obs;

  //nhu cầu đăng tin
  final RxString selectedValue = ''.obs;



  @override
  void onInit() {
    super.onInit();
    createTabController();
  }

  void createTabController() {
    // Sử dụng `this` làm `vsync` vì controller đã mixin `GetSingleTickerProviderStateMixin`
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  void onNextStep() {
    if (tabController.index < tabController.length - 1) {
      _currentStep.value++;
      tabController.animateTo(_currentStep.value);
    }
  }

  void onBackStep() {
    if (_currentStep.value > 0) {
      _currentStep.value--;
      tabController.animateTo(_currentStep.value);
    }
  }

    // Hàm cập nhật danh sách loại hình BĐS
  void updateTypeBDSOptions(String? selectedType) {
    if (selectedType == "APARTMENT") {
      typeBDSOptions.value = APARTMENT_BDS;
    } else if (selectedType == "BUILDING") {
      typeBDSOptions.value = BUILDING_BDS;
    } else if (selectedType == "GROUND") {
      typeBDSOptions.value = GROUND_BDS;
    } else if (selectedType == "REAL_ESTATE") {
      typeBDSOptions.value = REAL_ESTATE_BDS;
    } else {
      typeBDSOptions.value = [];
    }
  }
    //check trống của loại bđs để show ra text
  void validateTypeBDS() {
    if (typeBDSController.value.text.isEmpty) {
      typeBDSValidationError.value = 'Loại BĐS không được để trống';
    } else {
      typeBDSValidationError.value = '';
    }
  }

  //check trống của chọn loại bđs để show ra text
  void validateSelectTypeBDS() {
    if (selectTypeBDSController.value.text.isEmpty) {
      selectTypeBDSValidationError.value = 'Loại hình BĐS không được để trống';
    } 
    else {
      selectTypeBDSValidationError.value = '';
    }
  }




  
}
