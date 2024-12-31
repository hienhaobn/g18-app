import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:app/model_hieu/label_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostNewPageController extends BaseGetXController with GetSingleTickerProviderStateMixin {
  final FontController fontController = Get.find<FontController>();

  final Rx<TabController?> tabController = Rx<TabController?>(null);
  final RxInt currentStep = 0.obs;
  final typeBDSController = TextEditingController().obs;

  // Danh sách "Loại hình BĐS" dựa vào "Loại BĐS"
  RxList<LabelModal> typeBDSOptions = <LabelModal>[].obs;
  final Rx<LabelModal?> selectedRealEstateType = Rx<LabelModal?>(null);
  final typeBDSValidationError = ''.obs;
  final selectTypeBDSValidationError = ''.obs;
  final selectTypeBDSController = TextEditingController().obs;

  // Nhu cầu đăng tin
  final RxString selectedValue = ''.obs;

  // Họ và tên - SĐT - Gmail
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    createTabController();
  }

  void createTabController() {
    // Sử dụng `this` làm `vsync` vì controller đã mixin `GetSingleTickerProviderStateMixin`
    tabController.value = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  void onNextStep() {
    if (tabController.value != null && tabController.value!.index < tabController.value!.length - 1) {
      currentStep.value++;
      tabController.value!.animateTo(currentStep.value);
    }
  }

  void onBackStep() {
    if (tabController.value != null && currentStep.value > 0) {
      currentStep.value--;
      tabController.value!.animateTo(currentStep.value);
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

  // Check trống của loại BĐS để show ra text
  void validateTypeBDS() {
    if (typeBDSController.value.text.isEmpty) {
      typeBDSValidationError.value = 'Loại BĐS không được để trống';
    } else {
      typeBDSValidationError.value = '';
    }
  }

  // Check trống của chọn loại BĐS để show ra text
  void validateSelectTypeBDS() {
    if (selectTypeBDSController.value.text.isEmpty) {
      selectTypeBDSValidationError.value = 'Loại hình BĐS không được để trống';
    } else {
      selectTypeBDSValidationError.value = '';
    }
  }
}
