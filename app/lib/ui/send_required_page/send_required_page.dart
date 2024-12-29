import 'package:app/base_hieu/base_dropdown.dart';
import 'package:app/base_hieu/base_get_view.dart';
import 'package:app/base_hieu/bottom_button.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/const.dart';
import 'package:app/base_hieu/convert_value_2.dart';
import 'package:app/base_hieu/custom_input_field_money.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/model_hieu/label_model.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_bropdown_type_bds.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_building_floors.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_confirm_identity.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_dropdown_direction.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_dropdown_location.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_dropdown_type_of_bds.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_information.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_input_acreage.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_input_apartment_code.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_input_cost.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_input_description.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_input_facade.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_input_number_of_floor.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_input_street.dart';
import 'package:app/ui/send_required_page/widget_send_required/build_number_bedroom.dart';
import 'package:app/ui/send_required_page/widget_send_required/filter_2_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendRequirePage extends BaseGetWidget<SendRequiredPageController> {
  const SendRequirePage({super.key});

  @override
  SendRequiredPageController get controller =>
      Get.put(SendRequiredPageController());

  @override
  Widget build(BuildContext context) {
    return buildLoading(
      child: Scaffold(
        backgroundColor: AppColors.nFFFFFF,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          foregroundColor: Colors.transparent,
          scrolledUnderElevation: 0,
          elevation: 0,
          leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.white),
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              )),
          centerTitle: true,
          title: Text("Gửi yêu cầu", //: "Chỉnh sửa yêu cầu"
              style: controller.fontController.currentFontStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.nFFFFFF)
              //  AppStyles.textW700(context,
              //     size: 18, color: AppColors.nFFFFFF)
              ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: BoxDecoration(
                  color: AppColors.p4C28A5,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(24))),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: SingleChildScrollView(
                    child: Form(
                      key: controller.formKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Filter2Widget(
                            initValue: controller.nhucaudangtin.value?.value,
                            onDateRangeSelected: (String? status) {
                              controller.clickChonYeuCau(status ?? "null");
                            },
                          ),
                          Text(
                            'Thông tin nhu cầu',
                            style: controller.fontController.currentFontStyle
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          12.height,
                          //                     Obx(() {
                          //                       return Citydropdownwidget(
                          //                         controller: _logic.controllerCitty!,
                          //                         focusNode: _focusCity,
                          //                         enabled: true,
                          //                         initialValue: _logic.selectedCity.value,
                          //                         validator: ValidationBuilder(),
                          //                         onSelected: (AddresModel) {
                          //                           _logic.selectedCity.value = AddresModel;
                          //                           _logic.controllerTown?.text = "";
                          //                           _logic.controllerDistrict?.text = "";
                          //                           _logic.selectedDistrict.value = null;
                          //                           _logic.selectedTown.value = null;
                          //                         },
                          //                         onClear: () {
                          //                           _logic.selectedDistrict.value = null;
                          //                           _logic.selectedTown.value = null;
                          //                           _logic.selectedCity.value = null;
                          //                           _logic.controllerTown?.text = "";
                          //                           _logic.controllerDistrict?.text = "";
                          //                         },
                          //                       );
                          //                     }),
                          //                     18.height,
                          //                     Obx(() {
                          //                       return Districtdropdownwidget(
                          //                         controller: _logic.controllerDistrict!,
                          //                         focusNode: _focusDistrict,
                          //                         enabled: true,
                          //                         validator: ValidationBuilder(),
                          //                         initialValue: _logic.selectedDistrict.value,
                          //                         codeCity: _logic.selectedCity.value?.code ?? null,
                          //                         onSelected: (AddresModel) {
                          //                           _logic.selectedDistrict.value = AddresModel;
                          //                           _logic.controllerTown?.text = "";
                          //                         },
                          //                         onClear: () {
                          //                           _logic.selectedDistrict.value = null;
                          //                         },
                          //                       );
                          //                     }),
                          //                     18.height,
                          //                     Obx(() {
                          //                       return Towsdropdownwidget(
                          //                           controller: _logic.controllerTown!,
                          //                           focusNode: townFocus,
                          //                           codeTowns:
                          //                               _logic.selectedDistrict.value?.code ?? null,
                          //                           enabled: true,
                          //                           initialValue: _logic.selectedTown.value,
                          //                           onSelected: (AddresModel) {
                          //                             _logic.selectedTown.value = AddresModel;
                          //                           },
                          //                           onClear: () {
                          //                             _logic.selectedTown.value = null;
                          //                           },
                          //                           validator: ValidationBuilder());
                          //                     }),
                          //                     8.height,
                      
                          //đường phố
                          BuildInputStreet(controller: controller),
                      
                          8.height,
                          //
                          Text(
                            'Thông tin BĐS',
                            style: controller.fontController.currentFontStyle
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          12.height,
                      
                          //loại bđs
                          BuildDropdownTypeBDS(controller: controller),
                      
                          12.height,
                          //loại hình bđs
                          BuildDropdownTypeOfBDS(controller: controller),
                      
                          12.height,
                          //mã căn hộ
                          Obx(() {
                            if (controller.typeBDSController.value.value.text ==
                                "APARTMENT") {
                              return BuildInputApartmentCode(
                                  controller: controller);
                            } else {
                              return SizedBox();
                            }
                          }),
                      
                          //tòa khu - tầng dãy
                          Obx(() => (controller
                                      .typeBDSController.value.value.text ==
                                  "APARTMENT")
                              ? BuildInputBuildingFloor(controller: controller)
                              : SizedBox()),
                          //số phòng ngủ
                          Obx(() => (controller
                                      .typeBDSController.value.value.text ==
                                  "APARTMENT")
                              ? BuildInputNumberBedRoom(controller: controller)
                              : SizedBox()),
                      
                          //diện tích
                          BuildInputAcreage(controller: controller),
                          12.height,
                      
                          //mặt tiền
                          Obx(() =>
                              (controller.typeBDSController.value.value.text !=
                                      "APARTMENT")
                                  ? BuildInputFacade(controller: controller)
                                  : SizedBox()),
                      
                          //số tầng
                          Obx(() => (controller
                                          .typeBDSController.value.value.text ==
                                      "BUILDING" ||
                                  controller.typeBDSController.value.value.text ==
                                      "REAL_ESTATE")
                              ? BuildInputNumberOfFloor(controller: controller)
                              : SizedBox()),
                      
                          //hướng
                          BuildDropDownDirection(controller: controller),
                      
                          //vị trí
                          BuildDropDownLocation(controller: controller),
                      
                          //tài chính
                          BuildInputCost(controller: controller),
                          12.height,
                      
                          //mô tả
                          BuildInputDescription(controller: controller),
                          20.height,
                      
                          Text(
                            "Thông tin cá nhân",
                            style: controller.fontController.currentFontStyle
                                .copyWith(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          12.height,
                      
                          //họ và tên - sđt - email
                          BuildInformation(controller: controller),
                      
                          //xác nhận định danh
                          BuildConfirmIdentity(controller: controller),
                      
                          20.height
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
            margin: EdgeInsets.only(bottom: 20, left: 15, right: 15),
            child: BottomButton(
                // onTap: (controller.disableButton.value)
                //     ? () {
                //         print('ko đủ điều kiện');
                //       }
                //     : () {
                //         print('Nhấn');
                //         controller.sendRequiredButton();
                //       },
              onTap:   () {
                controller.validateTypeBDS();
                controller.validateSelectTypeBDS();
                    if (controller.formKey.currentState!.validate()) {
                      controller.sendRequiredButton();
                    } else {
                      print('Form không hợp lệ!');
                    }
                  },
                title: 'Gửi yêu cầu')),
      ),
    );
  }
}
