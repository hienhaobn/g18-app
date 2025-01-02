import 'package:app/base/data_demo.dart';

final List<CodeName> typeBDS = [
  CodeName("APARTMENT", 'Căn hộ'),
  CodeName("BUILDING",'Tòa nhà'),
  CodeName("GROUND",'Đất nền'),
  CodeName("REAL_ESTATE",'Nhà đất'),
];

CodeName feeTypeBDS(String status) {
  return typeBDS.firstWhere((element) => element.code == status.toUpperCase());
}

//----------------------------------------------------------------------------------------