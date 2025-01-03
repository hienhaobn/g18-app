import 'dart:math' as math;

import 'package:app/model/label_model.dart';
import 'package:flutter/material.dart';

const DX_DEFAULT_VALUE = 20.0;
const DY_DEFAULT_VALUE = 50.0;
String WARNING_LOADING = 'Cảnh báo'; //Tran.tr.unstable_connection_notice;
const EMPTY_AVATAR =
    'https://g18.s3.ap-southeast-1.amazonaws.com/1686626117645-adc441c740d89186c8c9.jpg';

const airlineNames2 = {
  "APARTMENT": 'Căn hộ',
  "BUILDING": 'Tòa nhà',
  "GROUND": 'Đất nền',
  "REAL_ESTATE": "Nhà đất",
};

final lstAirline2 = [
  "APARTMENT",
  "BUILDING",
  "GROUND",
  'REAL_ESTATE',
];

//1
List<LabelModal> APARTMENT_BDS = [
  LabelModal(label: 'Căn hộ chung cư', value: 'APARTMENT'),
  LabelModal(label: 'Căn hộ Penthouse', value: 'BUILDING'),
  LabelModal(label: 'Căn hộ Duplex', value: 'GROUND'),
  LabelModal(label: 'Căn hộ Studio', value: 'STUDIO'),
  LabelModal(label: 'Căn hộ Officetel', value: 'OFFICE_TEL'),
  LabelModal(label: 'Căn hộ Dual Key', value: 'DUAL_KEY'),
  LabelModal(label: 'Căn hộ Sân Vườn', value: 'GARDEN'),
  LabelModal(label: 'Căn hộ Khác', value: 'OTHER'),
];

//2
List<LabelModal> BUILDING_BDS = [
  LabelModal(label: 'Sàn văn phòng', value: 'OFFICE_FLOOR'),
  LabelModal(label: 'Sàn thương mại', value: 'COMMERCIAL_FLOOR'),
  LabelModal(label: 'Toà văn phòng', value: 'OFFICE_BUILDING'),
  LabelModal(label: 'Toà khách sạn', value: 'HOTEL_BUILDING'),
  LabelModal(label: 'Toà nhà hỗn hợp', value: 'MIXED_BUILDING'),
  LabelModal(label: 'Toà nhà khác', value: 'OTHER'),
];

//3
List<LabelModal> GROUND_BDS = [
  LabelModal(label: 'Đất ở', value: 'LANDSCAPE'),
  LabelModal(label: 'Đất dự án', value: 'PROJECT_LALND'),
  LabelModal(label: 'Đất khu công nghiệp', value: 'INDUSTRIAL_ZONE_LAND'),
  LabelModal(label: 'Nhà xưởng', value: 'FACTORY'),
  LabelModal(label: 'Kho/Bãi', value: 'WAREHOUSE'),
  LabelModal(label: 'Đất kinh doanh dịch vụ', value: 'SBL'),
  LabelModal(label: 'Đất nền khác', value: 'OTHER'),
];

//4
List<LabelModal> REAL_ESTATE_BDS = [
  LabelModal(label: 'Nhà ngõ', value: 'PRIVATE_HOUSE'),
  LabelModal(label: 'Nhà mặt phố', value: 'STREET_HOUSE'),
  LabelModal(label: 'Biệt thự', value: 'VILLA'),
  LabelModal(label: 'Liền kề', value: 'SEMI_DETACHED_VILLA'),
  LabelModal(label: 'Shophouse', value: 'SHOP_HOUSE'),
  LabelModal(label: 'Nhà đất khác', value: 'OTHER'),
];

//hướng
List<LabelModal> LABEL_DIRECTRION = [
  LabelModal(value: 'Đông', label: 'Đông'),
  LabelModal(value: 'Tây', label: 'Tây'),
  LabelModal(value: 'Nam', label: 'Nam'),
  LabelModal(value: 'Bắc', label: 'Bắc'),
  LabelModal(value: 'Đông Nam', label: 'Đông Nam'),
  LabelModal(value: 'Đông Bắc', label: 'Đông Bắc'),
  LabelModal(value: 'Tây Nam', label: 'Tây Nam'),
  LabelModal(value: 'Tây Bắc', label: 'Tây Bắc'),
  LabelModal(value: '(Tây Nam - Tây Bắc)', label: '(Tây Nam - Tây Bắc)'),
  LabelModal(value: '(Đông Nam - Đông Bắc)', label: '(Đông Nam - Đông Bắc)'),
  LabelModal(value: '(Đông Bắc - Tây Bắc)', label: '(Đông Bắc - Tây Bắc)'),
  LabelModal(value: '(Đông Nam - Tây Nam)', label: '(Đông Nam - Tây Nam)'),
];

//vị trí
List<LabelModal> LABEL_LOCATION = [
  LabelModal(value: 'Góc', label: 'Góc'),
  LabelModal(value: 'Thường', label: 'Thường'),
];

//xác nhận định danh
List<LabelModal> ListXacNhanDinhDanh = [
  LabelModal(value: 'CUSTOMER', label: 'Khách hàng'),
  LabelModal(value: 'AGENCY', label: 'Môi giới bất động sản')
];

//nhu cầu đăng tin
List<LabelModal> NHUCAUDANGTIN = [
  LabelModal(label: 'Cần bán BĐS', value: 'SELLING'),
  LabelModal(label: 'Cần cho thuê BĐS', value: 'RENTING'),
];

//rank
Map<String, String> rankIcons = {
  'Đá': 'assets/icons/rank_stone.png',
  'Đồng': 'assets/icons/rank_bronze.png',
  'Bạc': 'assets/icons/rank_silver.png',
  'Vàng': 'assets/icons/rank_gold.png',
  'Bạch Kim': 'assets/icons/rank_platinum.png',
  'Kim Cương': 'assets/icons/rank_diamond.png',
  'Thách đấu': 'assets/icons/rank_challenge.png',
  'Cao thủ': 'assets/icons/rank_master.png',
};

//chọn gói gia hạn
final List<LabelModal> DataRenewal = [
  LabelModal(value: "1", label: "Gói 1 tháng"),
  LabelModal(value: "3", label: "Gói 3 tháng"),
  LabelModal(value: "6", label: "Gói 6 tháng"),
  LabelModal(value: "9", label: "Gói 9 tháng"),
  LabelModal(value: "12", label: "Gói 1 năm")
];

//list trạng thái tin
List<LabelModal> ListOfNewStatus = [
  LabelModal(value: '1', label: 'Đã xử lý', color: Color(0xFFFF0000)),
  LabelModal(value: '0', label: 'Chưa xử lý', color: Color(0xFF0AAE84)),
];

//
List<LabelModal> viewSHOWLABLE = [
  LabelModal(label: 'Bán', value: 'SELLING', color: Colors.red),
  LabelModal(label: 'Thuê', value: 'RENTING', color: Colors.green),
  LabelModal(label: 'Tìm mua ', value: 'BUYING', color: Colors.black),
  LabelModal(label: 'Tìm thuê ', value: 'NEED_RENTING', color: Colors.green),
  LabelModal(label: 'Dự án', value: 'PROJECT', color: Colors.black),
];
//
List<LabelModal> VIEWSTATUS = [
  LabelModal(
      value: 'new', label: 'Mới', color: Color.fromARGB(255, 49, 138, 52)),
  LabelModal(value: 'CLOSED', label: 'Tạm dừng', color: Color(0xFFFFD910)),
  LabelModal(value: 'REQUEST', label: 'Hoàn hảo', color: Color(0xFFFF7E25)),
  LabelModal(value: 'STOP_REQUEST', label: 'Đã chốt', color: Color(0xFFFF0000)),
  LabelModal(value: 'AVAILABLE', label: 'Phương án', color: Color(0xFF0AAE84)),
  LabelModal(value: 'CLOSE_REQUEST', label: 'Loại', color: Color(0xFF000000)),
];