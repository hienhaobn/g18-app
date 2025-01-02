import 'dart:convert';
import 'package:intl/intl.dart';



const PATTERN_TIME = 'HH:mm dd/MM/yyyy';
const PATTERN_TIME_SEPERATE = 'HH:mm | dd/MM/yyyy';
const PATTERN_TIME_WITHDOW = 'EEE, HH:mm dd/MM/yyyy';
const PATTERN_TIME_HOURS = 'HH:mm';
const PATTERN_HHMMa = 'HH:mm a';
const PATTERN_DMY = 'dd/MM/yyyy';
String convertDateToString(DateTime? date,
    {String? pattern, String locale = 'vi'}) {
  if (date == null) {
    return '';
  }
  return DateFormat(pattern ?? 'dd/MM/yyyy', locale).format(date);
}

String? durationToString(int? minutes, {String? languageCode}) {
  if (minutes == null) {
    return null;
  }
  var d = Duration(minutes: minutes);
  List<String> parts = d.toString().split(':');

  if (languageCode == 'en') {
    return '${parts[0].padLeft(2, '0')}hr(s) ${parts[1].padLeft(2, '0')}min(s)';
  }
  return '${parts[0].padLeft(2, '0')}:${parts[1].padLeft(2, '0')}';
}

String convertDateToStringISO(DateTime? date, String? timezone) {
  if (date == null || timezone == null) {
    return '';
  }
  timezone = timezone.replaceAll(RegExp("GMT"), '');
  String dateTime = DateFormat("yyyy-MM-dd'T'HH:mm:ss").format(date);

  String dateTimeWithOffset = '$dateTime$timezone';
  return dateTimeWithOffset;
}

int convertStringToInt(String? value) {
  if (value == null || value.isEmpty) {
    return 0;
  }

  try {
    String sanitizedValue =
        value.replaceAll(":", "").replaceAll("+", "").replaceAll("-", "");
    return int.parse(sanitizedValue); // Chuyển đổi chuỗi thành int
  } catch (e) {
    return 0;
  }
}

String parseDateTimeString(String value) {
  if (value.isEmpty) {
    return '';
  }
  return DateFormat('dd/MM/yyyy').format(DateTime.parse(value));
}

DateTime stringToDate(String time) {
  return DateFormat("dd/MM/yyyy").parse(time);
}

DateTime stringToDate2(String time) {
  return DateFormat("yyyy-MM-dd").parse(time);
}

DateTime? tryStringToDate(String time) {
  try {
    return DateFormat("yyyy-MM-dd").parse(time);
  } catch (e) {
    return null;
  }
}

String formatDateString(String inputDate) {
  DateFormat inputFormat = DateFormat('dd/MM/yyyy');
  DateFormat outputFormat = DateFormat('yyyy-MM-dd');

  DateTime dateTime = inputFormat.parse(inputDate);
  String formattedDate = outputFormat.format(dateTime);

  return formattedDate;
}

String showValue(String text) {
  if (text.isEmpty) {
    return '';
  }
  return text;
}

String getDayOfWeek(DateTime time) {
  if (Intl.defaultLocale == 'vi') {
    return 'T${time.weekday}';
  }
  return DateFormat('EEEE').format(time).substring(0, 3);
}



String convertMoneytoStringDot2(num value, {String? symbol}) {
  final currencyFormatter = NumberFormat.currency(
      locale: 'vi', decimalDigits: 0, symbol: symbol ?? '');
  return currencyFormatter.format(value).trim();
}

String convertMoneytoReadable(num value) {
  final currencyFormatter = NumberFormat.compactCurrency(
      locale: 'en_US', decimalDigits: 0, symbol: '');
  return currencyFormatter.format(value);
}

// /// format tiền VN với pattern dấu phẩy(,)
String convertMoneytoStringComma(num value, {String symbol = ''}) {
  String formattedValue = value.toStringAsFixed(2);
  String sign = '';
  if (formattedValue.startsWith('-')) {
    sign = '-';
    formattedValue = formattedValue.substring(1);
  }

  List<String> parts = formattedValue.split('.');
  String integerPart = parts[0];

  integerPart = integerPart.replaceAll(RegExp(r'\D'), '');
  integerPart = integerPart.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), ',');

  String result =
      sign + (symbol.isEmpty ? integerPart : "$integerPart $symbol");

  return result;
}

String formatRangeDate(DateTime date) {
  const format = "EEE, dd-MM-yyyy";
  return DateFormat(format).format(date);
}

String formatDateYMD(DateTime date) {
  const format = "yyyy-MM-dd";
  return DateFormat(format).format(date);
}

String formatRangeDateAcr(DateTime date, locale) {
  const format = "EEE, dd/MM/yyyy";
  return DateFormat(format, locale).format(date);
}

String formatRangeDate1(DateTime date, locale) {
  const format = "EEEE, dd/MM/yyyy";
  return DateFormat(format, locale).format(date);
}

String formatRangeDate3(DateTime date, locale) {
  const format = "dd/MM/yyyy (EEEE)";
  return DateFormat(format, locale).format(date);
}

String formatRangeDate2(DateTime date) {
  const format = "EEE, dd-MM";
  return DateFormat(format).format(date);
}

String getDurationFlight(int minute) {
  if (minute < 60) {
    return '$minute minutes';
  } else {
    int hour = minute ~/ 60;
    int min = minute - (60 * hour);
    return '${hour}h${min}m';
  }
}

String getGenderByIndex(int index) {
  switch (index) {
    case 0:
      return "MALE";
    case 1:
      return "FEMALE";
    default:
      return "OTHER";
  }
}




// validate so dien thoai o VN
bool isPhoneVietNamValid(String value) {
  String valuePhone = '';
  if (!value.startsWith('0') && value.length == 9) {
    valuePhone = '84' + value;
  } else {
    valuePhone = value;
  }
  final start = valuePhone.startsWith(RegExp(r'^(\+84|84|0|02)'));
  if (start == false) {
    return false;
  }
  final rex = RegExp(r'(((\+|)84)|0|02)(1|2|3|4|5|6|7|8|9)+([0-9]{8})\b');
  String? result = rex.firstMatch(valuePhone)?.input;
  return result != null;
}

bool isCheckPhoneValid(String value) {
  // Kiểm tra nếu rỗng
  if (value.trim().isEmpty) {
    return false;
  }

  // Kiểm tra nếu bắt đầu bằng dấu +, sau đó phải là các số từ 0-9
  String pattern = r'^\+?[0-9]+$';
  RegExp regExp = RegExp(pattern);

  // Kiểm tra nếu chuỗi phù hợp với mẫu
  if (!regExp.hasMatch(value.trim())) {
    return false;
  }

  return true; // Trả về true nếu số điện thoại hợp lệ
}

bool isTimeValid(String time) {
  final date = stringToDate(time);
  return date.isAfter(DateTime.now());
}

bool isExpiredValid(String time) {
  final date = stringToDate(time);
  return date.isBefore(DateTime.now());
}

bool isTextTiengViet(String text) {
  if (text.trim().isEmpty) {
    return true;
  }
  final rex = RegExp(
      r'[àÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬđĐèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆìÌỉỈĩĨíÍịỊòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰỳỲỷỶỹỸýÝỵỴ]+');
  return rex.firstMatch(text)?.input != null;
}

DateTime getTimeLocal(String at, String timeZone) {
  try {
    DateTime? dateTimeGMT = DateTime.tryParse(at);
    String _timeZone = timeZone;
    final hourStr = _timeZone.split(":").first;
    if (hourStr.contains("+")) {
      dateTimeGMT =
          dateTimeGMT!.add(Duration(hours: int.parse(hourStr.split("+").last)));
    } else {
      dateTimeGMT = dateTimeGMT!
          .subtract(Duration(hours: int.parse(hourStr.split("-").last)));
    }
    return dateTimeGMT;
  } catch (e) {
    throw "Convert error";
    // return DateTime.now();
  }
}

String formatDateTimeToLocalString1(DateTime? at, String timeZone) {
  try {
    if (at == null) throw "Invalid DateTime";

    // Lấy múi giờ từ chuỗi timeZone
    String _timeZone = timeZone;
    final parts = _timeZone.split(":"); // Tách giờ và phút
    final hourStr = parts.first; // Lấy phần giờ
    final minuteStr = parts.length > 1
        ? parts.last
        : "0"; // Lấy phần phút (mặc định là 0 nếu không có)

    // Tính toán số giờ và phút
    final hours = int.parse(
        hourStr.replaceAll(RegExp(r"[+-]"), "")); // Loại bỏ dấu "+" hoặc "-"
    final minutes = int.parse(minuteStr); // Phút

    // Điều chỉnh thời gian
    Duration offset = Duration(hours: hours, minutes: minutes);
    if (_timeZone.contains("-")) {
      offset = -offset; // Trừ thời gian nếu là múi giờ âm
    }

    // Tính thời gian theo múi giờ
    final dateTimeLocal = at.add(offset);

    // Định dạng DateTime thành chuỗi
    return
        // "${dateTimeLocal.year}-${dateTimeLocal.month.toString().padLeft(2, '0')}-${dateTimeLocal.day.toString().padLeft(2, '0')} "
        "${dateTimeLocal.hour.toString().padLeft(2, '0')}:${dateTimeLocal.minute.toString().padLeft(2, '0')}";
  } catch (e) {
    throw "Convert error: $e";
  }
}

String formatDateTimeToLocalString(DateTime? at, String timeZone) {
  try {
    if (at == null) throw "Invalid DateTime";

    // Lấy múi giờ từ chuỗi timeZone
    String _timeZone = timeZone;
    final hourStr = _timeZone.split(":").first;

    // Chuyển đổi thời gian theo múi giờ
    DateTime dateTimeLocal;
    if (hourStr.contains("+")) {
      dateTimeLocal =
          at.add(Duration(hours: int.parse(hourStr.split("+").last)));
    } else if (hourStr.contains("-")) {
      dateTimeLocal =
          at.subtract(Duration(hours: int.parse(hourStr.split("-").last)));
    } else {
      dateTimeLocal = at; // Không thay đổi nếu không có múi giờ
    }

    // Định dạng DateTime thành chuỗi
    // return "${dateTimeLocal.year}-${dateTimeLocal.month.toString().padLeft(2, '0')}-${dateTimeLocal.day.toString().padLeft(2, '0')} "
    //     "${dateTimeLocal.hour.toString().padLeft(2, '0')}:${dateTimeLocal.minute.toString().padLeft(2, '0')}:${dateTimeLocal.second.toString().padLeft(2, '0')}";
    //---------dạng HH:mm
    return "${dateTimeLocal.hour.toString().padLeft(2, '0')}:${dateTimeLocal.minute.toString().padLeft(2, '0')}";
  } catch (e) {
    throw "Convert error: $e";
  }
}

String formatDateTimeToLocalString0(DateTime? at) {
  try {
    if (at == null) throw "Invalid DateTime";

    // Chuyển thời gian sang local
    DateTime dateTimeLocal = at.toLocal();

    // Định dạng DateTime thành chuỗi dạng HH:mm
    return "${dateTimeLocal.hour.toString().padLeft(2, '0')}:${dateTimeLocal.minute.toString().padLeft(2, '0')}";
  } catch (e) {
    throw "Convert error: $e";
  }
}

//dạng 15Nov : ngày + tháng viết tắt tiếng anh
String formatDateTimeToLocalString22(DateTime? at, String timeZone) {
  try {
    if (at == null) throw "Invalid DateTime";

    // Lấy múi giờ từ chuỗi timeZone
    String _timeZone = timeZone;
    final parts = _timeZone.split(":"); // Tách giờ và phút
    final hourStr = parts.first; // Phần giờ
    final minuteStr = parts.length > 1
        ? parts.last
        : "0"; // Phần phút (mặc định là 0 nếu không có)

    // Tính toán số giờ và phút
    final hours = int.parse(
        hourStr.replaceAll(RegExp(r"[+-]"), "")); // Loại bỏ dấu "+" hoặc "-"
    final minutes = int.parse(minuteStr); // Phút

    // Điều chỉnh thời gian
    Duration offset = Duration(hours: hours, minutes: minutes);
    if (_timeZone.contains("-")) {
      offset = -offset; // Trừ thời gian nếu là múi giờ âm
    }

    // Tính thời gian theo múi giờ
    final dateTimeLocal = at.add(offset);

    // Định dạng DateTime thành chuỗi "dMMM" (Ví dụ: 15Dec)
    return DateFormat("dMMM", 'en_US').format(dateTimeLocal);
  } catch (e) {
    throw "Convert error: $e";
  }
}

String formatDateTimeToLocalString2(DateTime? at, String timeZone) {
  try {
    if (at == null) throw "Invalid DateTime";

    // Get timezone from the timeZone string
    String _timeZone = timeZone;
    final hourStr = _timeZone.split(":").first;

    // Convert time according to the timezone
    DateTime dateTimeLocal;
    if (hourStr.contains("+")) {
      dateTimeLocal =
          at.add(Duration(hours: int.parse(hourStr.split("+").last)));
    } else if (hourStr.contains("-")) {
      dateTimeLocal =
          at.subtract(Duration(hours: int.parse(hourStr.split("-").last)));
    } else {
      dateTimeLocal = at; // No change if there is no timezone
    }

    // Format DateTime to string "15Dec" (MMM in English)
    return DateFormat("dMMM", 'en_US')
        .format(dateTimeLocal); // Example: "15Dec"
  } catch (e) {
    throw "Convert error: $e";
  }
}



String getTimeZoneByCurrentLocation(DateTime? at) {
  if (at == null) {
    return '';
  }
  final now = DateTime.now();
  final minute = now.timeZoneOffset.inMinutes;
  if (minute < 0) {
    return convertDateToString(at.subtract(Duration(minutes: minute)));
  } else {
    return convertDateToString(at.add(Duration(minutes: minute)));
  }
}

DateTime getTimeZoneByCurrentLocationDate(DateTime at) {
  final now = DateTime.now();
  final minute = now.timeZoneOffset.inMinutes;
  if (minute < 0) {
    return at.subtract(Duration(minutes: minute));
  } else {
    return at.add(Duration(minutes: minute));
  }
}

String getTimeZoneByCurrentLocation2(DateTime? at) {
  if (at == null) {
    return '';
  }
  Duration timeZoneOffset = at.timeZoneOffset;
  String offset = timeZoneOffset.isNegative ? '-' : '+';
  offset += timeZoneOffset.inHours.toString().padLeft(2, '0');
  offset += ':' + (timeZoneOffset.inMinutes % 60).toString().padLeft(2, '0');
  return offset;
}

bool isTimeBirtdayValid(String time) {
  final date = stringToDate(time);
  return date.isBefore(DateTime.now());
}




String convertToTotalMoney(String beforeAmount, String percent) {
  if (beforeAmount.isEmpty || percent.isEmpty) {
    return '';
  }
  try {
    final beforeValue = int.parse(beforeAmount.replaceAll('.', ''));
    final percentValue = double.parse(percent);
    final total = beforeValue + (beforeValue * percentValue / 100);
    return convertMoneytoStringDot2(total);
  } catch (e) {
    return '';
  }
}

String convertToBeforeMoney(String unitPrice, String amount) {
  if (unitPrice.isEmpty || amount.isEmpty) {
    return '';
  }
  try {
    final unitValue = int.parse(unitPrice.replaceAll('.', ''));
    final amountValue = int.parse(amount);
    final total = unitValue * amountValue;
    return convertMoneytoStringDot2(total);
  } catch (e) {
    return '';
  }
}

int getNumberByText(String text) {
  try {
    return int.parse(text);
  } catch (e) {
    return 0;
  }
}

double vatRateByText(String text) {
  try {
    return double.parse(text);
  } catch (e) {
    return 0;
  }
}



String getLocationShow(String location, bool available) {
  final locationArr = location.split('|');
  if (locationArr.isEmpty || location.isEmpty) {
    return '';
  }
  List<String> seatKeys = [];
  final seatMaps = {
    "Window": ['Window', 'W'],
    "AisleSeat": ['AisleSeat', 'A'],
    "ExitRowSeat": ['ExitRowSeat', 'E', 'emergencyExit'],
    "RightSideOfAircraft": ['RightSideOf Aircraft'],
    "LeftSideOfAircraft": ['LeftSideOfAircraft'],
    "OverWingSeat": ['OverWingSeat(S)'],
    "CenterSectionSeat": ['CenterSectionSeat(S)'],
    "LimitedRecline": ['limitedRecline'],
    "BulkheadFront": ['bulkheadFront'],
    "FrontOfCabinClassCompartment": ['Front of cabin class/compartment'],
    "SeatSuitableForAdultWithAnInfant": [
      'Seat suitable for adult with an infant'
    ],
    "BufferZoneSeat": ['Buffer zone seat'],
    "ChargeableSeats": ['Chargeable seats'],
    "RestrictedSeatGeneral": ['Restricted seat - General'],
    "SeatWithBassinetFacility": ['Seat with bassinet facility'],
    "NoFacilitySeatIndifferentSeat": ['No facility seat (indifferent seat)'],
  };
  for (var entry in seatMaps.entries) {
    final key = entry.key;
    final values = entry.value;
    if (locationArr.any((location) => values.any((e) {
          String locationValue = location.replaceAll(' ', '').toUpperCase();
          String value = e.replaceAll(' ', '').toUpperCase();
          return value.contains(locationValue);
        }))) {
      seatKeys.add(key);
      continue;
    }
  }
  if (seatKeys.isEmpty) {
    if (available) {
      return 'Trống';
    }
    return '';
  }
  String result = '';
  for (var item in seatKeys) {
    if (result.isNotEmpty) {
      result += '\n${Intl.message(item, name: item)}';
    } else {
      result = Intl.message(item, name: item);
    }
  }
  return result;
}



String formatDateDDMMM(DateTime date) {
  return DateFormat('ddMMM', 'en').format(date);
}

String formatDateYYYYMMDD(DateTime date) {
  return DateFormat('yyyy-MM-dd', 'en').format(date);
}

// String getTitleVNByPaxType(String type, String paxType) {
//   switch (type) {
//     case "MR":
//       return 'Ông';
//     case "MRS":
//       return 'Bà';
//     case "MS":
//       return 'Cô';
//     case "MSTR":
//       if (paxType == INFANT) {
//         return Tran.tr.male_babies;
//       } else {
//         return 'Bé trai';
//       }

//     case "MISS":
//       if (paxType == INFANT) {
//         return Tran.tr.female_babies;
//       } else {
//         return 'Bé gái';
//       }
//     default:
//       return '';
//   }
// }

String toNonAccentVietnamese(String str) {
  str = str.toLowerCase();
  str = str.replaceAll(RegExp(r'[àáạảãâầấậẩẫăằắặẳẵ]'), "a");
  str = str.replaceAll(RegExp(r'[èéẹẻẽêềếệểễ]'), "e");
  str = str.replaceAll(RegExp(r'[ìíịỉĩ]'), "i");
  str = str.replaceAll(RegExp(r'[òóọỏõôồốộổỗơờớợởỡ]'), "o");
  str = str.replaceAll(RegExp(r'[ùúụủũưừứựửữ]'), "u");
  str = str.replaceAll(RegExp(r'[ỳýỵỷỹ]'), "y");
  str = str.replaceAll(RegExp(r'đ'), "d");
  // Some system encode Vietnamese combining accent as individual utf-8 characters
  str = str.replaceAll(RegExp(r'[\u0300\u0301\u0303\u0309\u0323]'),
      ""); // Huyền sắc hỏi ngã nặng
  str = str.replaceAll(RegExp(r'[\u02C6\u0306\u031B]'), ""); // Â, Ê, Ă, Ơ, Ư
  return str.toUpperCase();
}

String convertToMonthAbbreviation(String inputDate) {
  // Split the input date string into day and month parts
  List<String> dateParts = inputDate.split('/');

  if (dateParts.length == 2) {
    // Map month numbers to their abbreviated names
    Map<String, String> monthAbbreviations = {
      "01": "JAN",
      "02": "FEB",
      "03": "MAR",
      "04": "APR",
      "05": "MAY",
      "06": "JUN",
      "07": "JUL",
      "08": "AUG",
      "09": "SEP",
      "10": "OCT",
      "11": "NOV",
      "12": "DEC",
    };

    // Get the day and month parts
    String day = dateParts[0];
    String month = dateParts[1];

    // Check if the month is valid
    if (monthAbbreviations.containsKey(month)) {
      // Convert the month to its abbreviation and concatenate with the day
      return "$day${monthAbbreviations[month]}";
    }
  }

  // Return the original input if the format is not valid
  return inputDate;
}

String getDate(String value) {
  RegExp datePattern = RegExp(r'\b\d{1,2}/\d{1,2}/\d{4}\b');

  Match? match = datePattern.firstMatch(value);

  String? extractedDate;
  if (match != null) {
    extractedDate = match.group(0);
  }
  final _exDate = extractedDate ?? '';
  if (_exDate.length < 10) {
    List<String> dateParts = _exDate.split('/');

    int day = int.parse(dateParts[0]);
    int month = int.parse(dateParts[1]);
    int year = int.parse(dateParts[2]);

    String formattedDay = day < 10 ? '0$day' : day.toString();
    String formattedMonth = month < 10 ? '0$month' : month.toString();

    return "$formattedDay/$formattedMonth/$year";
  }
  return _exDate;
}

// chi dung cho phan nhap ten nhanh
bool hasDateInString(String value) {
  RegExp datePattern = RegExp(r"(\d{1,2})/(\d{1,2})/(\d{4})");
  if (datePattern.hasMatch(value)) {
    return true;
  } else {
    return false;
  }
}

bool hasNumber(String input) {
  final RegExp numberRegExp = RegExp(r'\d');
  return numberRegExp.hasMatch(input);
}

bool isNumberGreaterThanZero(String input) {
  String _value = input.replaceAll('.', '').trim();
  int? number = int.tryParse(_value);
  return number != null && number > 0;
}





int doubleToInt(num value) {
  if (value is double) {
    return value.toInt();
  } else if (value is int) {
    return value;
  } else {
    throw ArgumentError('Invalid value type.');
  }
}

String convertToCustomFormat(String time) {
  DateTime dateTime = DateTime.parse(time);
  String formattedTime = DateFormat('HH:mm, dd/MM/yyyy').format(dateTime);
  return formattedTime;
}





checkValid({
  required String value,
  required String error,
}) {
  if (value.trim().isEmpty) {
    return error;
  }
  return null;
}

String? validatedPhoneNumber(value) {
  if (isCheckPhoneValid(value!)) {
    return 'Số điện thoại không hợp lệ';
  }
  return null;
}

// DateTime convertDateFormat(String inputDate) {
//   // Định dạng ngày đầu vào
//   DateFormat inputFormat = DateFormat('EEE, dd-MM-yyyy', 'vi');

//   // Chuyển đổi chuỗi ngày đầu vào thành đối tượng DateTime
//   DateTime dateTime = inputFormat.parse(inputDate);

//   return dateTime;
// }
DateTime convertDateFormat(String inputDate) {
  // Định dạng ngày cho tiếng Anh và tiếng Việt
  final englishFormat = DateFormat('EEE, dd-MM-yyyy', 'en');
  final vietnameseFormat = DateFormat('EEE, dd-MM-yyyy', 'vi');

  // Thử phân tích chuỗi ngày với định dạng tiếng Anh
  try {
    return englishFormat.parse(inputDate);
  } catch (e) {
    // Nếu phân tích bằng tiếng Anh không thành công, thử phân tích với định dạng tiếng Việt
    try {
      return vietnameseFormat.parse(inputDate);
    } catch (e) {
      // Nếu phân tích bằng cả hai định dạng đều không thành công, ném lỗi
      throw FormatException('Date format is incorrect');
    }
  }
}

String getFormattedJson(String newValue) {
  if (newValue == '' || newValue.isEmpty) {
    return '';
  }

  var decoded = jsonDecode(newValue);

  if (decoded is Map<String, dynamic>) {
    List<String> keyValuePairs = [];
    decoded.forEach((key, value) {
      keyValuePairs.add(value != null ? '$key: $value' : '$key: ');
    });
    return keyValuePairs.join(', ');
  } else {
    throw Exception('Invalid JSON format');
  }
}
// String formatDateYYYYMMDDV2(String dateStr) {
//   DateFormat originalFormat = DateFormat('dd/MM/yyyy');
//   DateFormat targetFormat = DateFormat('yyyy-MM-dd');

//   DateTime dateTime = originalFormat.parse(dateStr);
//   return targetFormat.format(dateTime);
// }
String formatDateYYYYMMDDV2(String dateStr) {
  DateFormat originalFormat = DateFormat('dd/MM/yyyy');
  DateFormat targetFormat = DateFormat('yyyy-MM-dd');

  try {
    if (dateStr == null || dateStr.isEmpty) {
      throw FormatException('Ngày tháng không được rỗng');
    }

    // Phân tích ngày tháng
    DateTime dateTime = originalFormat.parse(dateStr);

    return targetFormat.format(dateTime);
  } catch (e) {
    print('Lỗi khi phân tích ngày tháng: $e');
    return 'Ngày tháng không hợp lệ';
  }
}

String formatDateYYYYMMDDV3(String dateStr) {
  DateFormat originalFormat = DateFormat('dd/MM/yyyy');
  DateFormat targetFormat = DateFormat('yyyy-MM-dd');

  DateTime dateTime = originalFormat.parse(dateStr);
  return targetFormat.format(dateTime);
}

String formatDateDDMMYYYY(String dateStr) {
  DateFormat originalFormat = DateFormat('yyyy-MM-dd');
  DateFormat targetFormat = DateFormat('dd-MM-yyyy');

  DateTime dateTime = originalFormat.parse(dateStr);
  return targetFormat.format(dateTime);
}

DateTime convertStringToDate(String dateString) {
  // Giả sử định dạng là "dd/MM/yyyy"
  List<String> parts = dateString.split('/');
  if (parts.length == 3) {
    int day = int.parse(parts[0]);
    int month = int.parse(parts[1]);
    int year = int.parse(parts[2]);
    return DateTime(year, month, day);
  }
  throw FormatException("Invalid date format");
}

bool isValidDateWithin6Months(DateTime dateToCheck, DateTime startTime) {
  final DateTime currentDate = startTime;
  final DateTime sixMonthsLater = DateTime(
    currentDate.year,
    currentDate.month + 6,
    currentDate.day,
  );
  if (startTime.isAfter(dateToCheck)) {
    return true;
  }
  return dateToCheck.isAfter(currentDate) &&
      dateToCheck.isBefore(sixMonthsLater);
}

// String convertMonthToFullName(String month, String isLanguage) {
//   // Danh sách tên tháng đầy đủ
//   final monthsInEnglish = [
//     "January",
//     "February",
//     "March",
//     "April",
//     "May",
//     "June",
//     "July",
//     "August",
//     "September",
//     "October",
//     "November",
//     "December"
//   ];

//   final monthsInVietnamese = [
//     "Tháng 1",
//     "Tháng 2",
//     "Tháng 3",
//     "Tháng 4",
//     "Tháng 5",
//     "Tháng 6",
//     "Tháng 7",
//     "Tháng 8",
//     "Tháng 9",
//     "Tháng 10",
//     "Tháng 11",
//     "Tháng 12"
//   ];

//   // Tìm chỉ số tháng dựa trên chuỗi tháng đầu vào
//   int monthIndex = monthsInVietnamese.indexOf(month);

//   if (monthIndex == -1) {
//     throw "Invalid month format: $month"; // Nếu không tìm thấy
//   }
//   isLanguage = storageApp.getLanguage();
//   // Trả về tên tháng dựa trên ngôn ngữ
//   if (isLanguage == "en") {
//     return monthsInEnglish[monthIndex];
//   } else if (isLanguage == "vi") {
//     return monthsInVietnamese[monthIndex];
//   } else {
//     throw "Unsupported language"; // Ngôn ngữ không hỗ trợ
//   }
// }

String formatCustomDate(int year, int month, int day, String isLanguage) {
  DateTime date = DateTime(year, month, day);

  if (isLanguage == "en") {
    // Định dạng ngày cho tiếng Anh
    String weekday = DateFormat('EEEE').format(date); // Tên ngày trong tuần
    String monthName = DateFormat('MMMM').format(date); // Tên tháng đầy đủ
    String daySuffix = getDaySuffix(day); // Hậu tố của ngày

    return '$weekday, $monthName $day$daySuffix, $year';
  } else if (isLanguage == "vi") {
    // Định dạng ngày cho tiếng Việt
    String weekday =
        DateFormat('EEEE', 'vi').format(date); // Tên ngày trong tuần
    String monthName =
        DateFormat('MMMM', 'vi').format(date); // Tên tháng đầy đủ

    return '$weekday, ngày $day tháng $month năm $year';
  } else {
    throw "Unsupported language"; // Nếu ngôn ngữ không hợp lệ
  }
}

// Hàm để lấy hậu tố cho ngày (cho tiếng Anh)
String getDaySuffix(int day) {
  if (day >= 11 && day <= 13) {
    return 'th'; // 11th, 12th, 13th
  }
  switch (day % 10) {
    case 1:
      return 'st'; // 1st, 21st, 31st
    case 2:
      return 'nd'; // 2nd, 22nd
    case 3:
      return 'rd'; // 3rd, 23rd
    default:
      return 'th'; // Các ngày còn lại
  }
}

//với at: '2024-11-24T20:20:00.000Z'  và timeZone: '+07:00' == 2024-11-25 đã cộng timeZone
String formatDateTimeWithTimeZonee(DateTime? dateTime, String timeZone) {
  try {
    // Tính toán offset từ timeZone (+07:00 hoặc -05:00)
    final offsetSign =
        timeZone.startsWith('-') ? -1 : 1; // Xác định dấu (+ hoặc -)
    final offsetParts =
        timeZone.replaceAll('+', '').replaceAll('-', '').split(':');
    final hoursOffset = int.parse(offsetParts[0]) * offsetSign;
    final minutesOffset = int.parse(offsetParts[1]) * offsetSign;

    // Cộng thêm offset vào DateTime
    DateTime adjustedDateTime = dateTime!.add(Duration(
      hours: hoursOffset,
      minutes: minutesOffset,
    ));

    // Định dạng lại thời gian thành yyyy-MM-dd
    return DateFormat('yyyy-MM-dd').format(adjustedDateTime);
  } catch (e) {
    // Xử lý lỗi nếu có
    print('Error parsing TimeZone: $e');
    return 'Invalid Date';
  }
}

// import 'package:intl/intl.dart';

String formatDateTimeWithTimeZoneee(DateTime? dateTime, String timeZone) {
  try {
    // Kiểm tra null cho dateTime
    if (dateTime == null) {
      throw ArgumentError("dateTime cannot be null");
    }

    // Xác định dấu (+ hoặc -) từ timeZone
    final offsetSign = timeZone.startsWith('-') ? -1 : 1;

    // Phân tách timeZone thành giờ và phút
    final offsetParts =
        timeZone.replaceAll('+', '').replaceAll('-', '').split(':');
    final hoursOffset = int.parse(offsetParts[0]) * offsetSign;
    final minutesOffset = int.parse(offsetParts[1]) * offsetSign;

    // Cộng thêm offset vào DateTime
    final adjustedDateTime = dateTime.toUtc().add(Duration(
          hours: hoursOffset,
          minutes: minutesOffset,
        ));

    // Định dạng lại thời gian thành yyyy-MM-dd
    return DateFormat('yyyy-MM-dd').format(adjustedDateTime);
  } catch (e) {
    // Xử lý lỗi nếu có
    print('Error parsing TimeZone: $e');
    return 'Invalid Date';
  }
}

String formatToK(int value) {
  if (value == 0) return 'Hết chỗ';
  // Chia cho 1000 để lấy giá trị "nghìn"
  double valueInThousands = value / 1000;

  // Định dạng số với dấu phân cách hàng nghìn và giữ 3 chữ số sau dấu thập phân
  String formattedValue = NumberFormat('#,##0.###').format(valueInThousands);

  // Thêm chữ "K" vào cuối
  return '${formattedValue}K';
}
