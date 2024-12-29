
import 'package:app/base_hieu/base_getx_controller.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:app/model_hieu/label_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendRequiredPageController extends BaseGetXController { 
 var nhucaudangtin = Rxn<LabelModal?>(LabelModal(value: "RENTING"));
 TextEditingController controllDuongpho = TextEditingController();

final FontController fontController = Get.find<FontController>();

  final typeBDSController = TextEditingController().obs;
  final selectTypeBDSController = TextEditingController().obs;

  // Danh sách "Loại hình BĐS" dựa vào "Loại BĐS"
  RxList<LabelModal> typeBDSOptions = <LabelModal>[].obs;
  final Rx<LabelModal?> selectedRealEstateType = Rx<LabelModal?>(null);
//mã căn hộ  :  khi typeBDSController là APARTMENT
 TextEditingController apartmentCodeController = TextEditingController();
 //số phòng ngủ
 TextEditingController numberBedRoomController = TextEditingController();
 //tòa/khu + tầng dãy :
 TextEditingController buildingAreaController = TextEditingController();
 TextEditingController rowFloorController = TextEditingController();
  //Diện tích
 TextEditingController acreageController = TextEditingController();
  //Mặt tiền
 TextEditingController facadeController = TextEditingController();
  //số tầng
 TextEditingController numberFloorsController = TextEditingController();
 //hướng
  var selectedDirection = Rxn<LabelModal>(); 
 //vị trí
  var selectedLocation = Rxn<LabelModal>(); 
  //tài chính
  TextEditingController selectedPriceController = TextEditingController();
   var inputValueCost =''.obs;
   //mô tả
  TextEditingController descriptionController = TextEditingController();
   //họ và tên - sđt - gmail
  TextEditingController fullNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  //xác nhận định danh
   RxBool isCustomerSelected = false.obs;
  RxBool isAgencySelected = false.obs;







 @override
  void onInit() {
    super.onInit();
    // updateTypeBDSOptions(typeBDSController.value.text); // Khởi tạo danh sách

  }

 void clickChonYeuCau(String yeucau) {
    nhucaudangtin.value = LabelModal(value: yeucau);
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

  void toggleCustomer() {
    isCustomerSelected.value = true;
    isAgencySelected.value = false;
  }

  void toggleAgency() {
    isAgencySelected.value = true;
    isCustomerSelected.value = false;
  }

    Future<void> sendRequiredButton() async {
      setLoading(true);
      try {
        // var res =
        //     await _empRepository.getEmployeeDetail(StorageApp.getAccountId());
        // if (res.isSuccessed) {
          // Get.find<HomeController>().userEmp = res.data;
          // userInfo = res.data;
          // update();
        // }
        await Future.delayed(Duration(seconds: 3)); // Thêm delay 3 giây
      } catch (e) {
        // handleOnError(e);
      } finally {
        setLoading(false);
      }
    }




  

}