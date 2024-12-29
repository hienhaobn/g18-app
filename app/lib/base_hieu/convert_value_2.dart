
//---------------------------------------------------------------------------------------------
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
  String numericValue = unit != null ? value.replaceAll(unit, '').trim() : value;

  // Chuyển đổi thành số thực
  double number = double.tryParse(numericValue.replaceAll(',', '').trim()) ?? 0.0;

  // Xử lý phần thập phân:
  // Nếu số tròn (dạng .000), bỏ hoàn toàn phần thập phân
  if (number == number.truncateToDouble()) {
    return '${number.toInt()}${unit != null ? ' $unit' : ''}';
  }

  // Nếu số có phần thập phân khác .000, xử lý giữ tối đa 3 chữ số thập phân
  String formattedNumber = number.toStringAsFixed(3).replaceAll(RegExp(r'0+$'), '').replaceAll(RegExp(r'\.$'), '');
  
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