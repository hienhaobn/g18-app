//---------------------------------------------------------------------------------------------
import 'package:app/base/const.dart';
import 'package:app/model/label_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

String formatStringToMoneyNumber(String value) {
  if (value == "Liên hệ" || value == "null") {
    return 'Liên hệ';
  }

  // Kiểm tra xem giá trị có chứa từ khóa "Triệu", "Tỷ" hoặc "Nghìn"
  if (value.contains('Triệu')) {
    return _processDecimal(value, 'Triệu');
  } else if (value.contains('Tỷ')) {
    return _processDecimal(value, 'Tỷ');
  } else if (value.contains('Nghìn')) {
    return _processDecimal(value, 'Nghìn');
  }

  // Nếu không chứa các đơn vị đặc biệt, xử lý như số bình thường
  return _processDecimal(value, null);
}

String _processDecimal(String value, String? unit) {
  // Loại bỏ đơn vị để xử lý phần số
  String numericValue =
      unit != null ? value.replaceAll(unit, '').trim() : value;

  // Chuyển đổi thành số thực
  double number =
      double.tryParse(numericValue.replaceAll(',', '').trim()) ?? 0.0;

  // Xử lý phần thập phân:
  // Nếu số tròn (dạng .000), bỏ hoàn toàn phần thập phân
  if (number == number.truncateToDouble()) {
    return '${number.toInt()}${unit != null ? ' $unit' : ''}';
  }

  // Nếu số có phần thập phân khác .000, xử lý giữ tối đa 3 chữ số thập phân
  String formattedNumber = number
      .toStringAsFixed(3)
      .replaceAll(RegExp(r'0+$'), '')
      .replaceAll(RegExp(r'\.$'), '');

  return '$formattedNumber${unit != null ? ' $unit' : ''}';
}

//---------------------------------------------------------------------------------------------

String formatNumberPriceFromString(String numberString) {
  try {
    // Loại bỏ tất cả dấu '.' khỏi chuỗi
    String cleanedString = numberString.replaceAll('.', '');

    // Chuyển đổi chuỗi đã làm sạch sang số nguyên
    int number = int.parse(cleanedString);

    // Xử lý định dạng
    if (number >= 1e9) {
      return "${(number / 1e9).toStringAsFixed(3)} Tỷ";
    } else if (number >= 1e6) {
      return "${(number / 1e6).toStringAsFixed(3)} Triệu";
    } else if (number >= 1e3) {
      return "${(number / 1e3).toStringAsFixed(3)} Nghìn";
    } else {
      return number.toStringAsFixed(3); // Số nhỏ hơn 1000 vẫn giữ nguyên.
    }
  } catch (e) {
    // Nếu đầu vào không phải là số hợp lệ, trả về thông báo lỗi
    return "";
  }
}

//---------------------------------------------------------------------------------------------

String formatStringToDate(dynamic date, String farmatDate) {
  try {
    DateTime dateTime = DateTime.parse(date);
    // String formattedDate = DateFormat('yyyy-MM-dd hh:ss').format(dateTime);
    String formattedDate = DateFormat(farmatDate).format(dateTime);
    return formattedDate;
  } catch (error) {
    return "_";
  }
}
//---------------------------------------------------------------------------------------------

String renderRank(dynamic value) {
  try {
    int _rank = parseInt(value);
    return _rank >= 4200000000
        ? 'Cao thủ'
        : _rank >= 3600000000
            ? 'Thách đấu'
            : _rank >= 3000000000
                ? 'Kim Cương'
                : _rank >= 2400000000
                    ? 'Bạch Kim'
                    : _rank >= 1800000000
                        ? 'Vàng'
                        : _rank >= 1200000000
                            ? 'Bạc'
                            : _rank >= 600000000
                                ? 'Đồng'
                                : 'Đá';
  } catch (error) {
    return "Đá";
  }
}
//---------------------------------------------------------------------------------------------

int parseInt(dynamic value, [int defaultValue = 0]) {
  if (value is int) {
    return value;
  } else if (value is String) {
    return int.tryParse(value) ?? defaultValue;
  } else {
    return defaultValue;
  }
}
//---------------------------------------------------------------------------------------------


String renderTime(dynamic time) {
  if (time == null) return "-";

  return time;
}

//---------------------------------------------------------------------------------------------



String formatStringToDateVN(dynamic dateString, String format) {
  try {
    DateTime dateTime = DateTime.parse(dateString);

    // Cộng thêm 7 giờ
    DateTime adjustedDate = dateTime.add(Duration(hours: 7));

    // Định dạng lại thành chuỗi theo yêu cầu
    return DateFormat(format).format(adjustedDate);
  } catch (err) {
    return "-";
  }
}

//---------------------------------------------------------------------------------------------

Color getColorStatus(String status) {
  LabelModal? ffd = VIEWSTATUS.firstWhereOrNull((test) => test.label == status);
  if (ffd != null) {
    return ffd.color!;
  } else {
    return Colors.redAccent;
  }
}