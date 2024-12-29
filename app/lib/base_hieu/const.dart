import 'dart:math' as math;

import 'package:app/model_hieu/label_model.dart';

const DX_DEFAULT_VALUE = 20.0;
const DY_DEFAULT_VALUE = 50.0;
String WARNING_LOADING = 'Cảnh báo';//Tran.tr.unstable_connection_notice;


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