import 'package:app/base/base_dropdown.dart';
import 'package:app/base/const.dart';
import 'package:app/base/styles.dart';
import 'package:app/model/label_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetDropDownTypeBDS extends StatelessWidget {
  const WidgetDropDownTypeBDS({
    super.key,
    required this.label,
    required this.currentValue,
    this.hintText,
    // required this.items,
    required this.onChange,
    required this.validationError,
    required this.items,
    required this.items2,
  });

  final String label; // Nhãn của dropdown
  final String? currentValue; // Giá trị hiện tại
  final String? hintText; // Gợi ý khi không có giá trị
  final List<String> items; // Danh sách lựa chọn
  final Map<String, String> items2;
  final void Function(String?) onChange; // Hàm xử lý khi thay đổi
  final String validationError; // Lỗi xác thực

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
            padding: EdgeInsets.only(left: 15, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200], // Màu nền
              border: Border.all(
                color: validationError.isNotEmpty
                    ? Colors.red // Viền đỏ khi có lỗi
                    : Colors.grey, // Viền bình thường khi không có lỗi
              ),
            ),
            child: BuildDropDownV2<String>(
              currentValue: currentValue,
              hintText: hintText ?? 'Chọn',
              onChange: onChange,
              childs: items
                  .map<DropdownMenuItem<String>>(
                    (type) => DropdownMenuItem(
                      value: type,
                      child: Text(
                        items2[type] ?? '',
                        style: AppStyles.contentStyleV2,
                      ),
                    ),
                  )
                  .toList(),
            )),
        if (validationError.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              validationError,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
class WidgetDropDownSelectTypeBDS extends StatelessWidget {
  const WidgetDropDownSelectTypeBDS({
    super.key,
    required this.label,
    required this.currentValue,
    this.hintText,
    // required this.items,
    required this.onChange,
    required this.validationError,
    required this.items,
  });

  final String label; // Nhãn của dropdown
  final LabelModal? currentValue; // Giá trị hiện tại
  final String? hintText; // Gợi ý khi không có giá trị
  final List<LabelModal> items; // Danh sách lựa chọn
  final void Function(LabelModal?) onChange; // Hàm xử lý khi thay đổi
  final String validationError; // Lỗi xác thực

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Container(
            padding: EdgeInsets.only(left: 15, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200], // Màu nền
              border: Border.all(
                color: validationError.isNotEmpty
                    ? Colors.red // Viền đỏ khi có lỗi
                    : Colors.grey, // Viền bình thường khi không có lỗi
              ),
            ),
            child: BuildDropDownV2<LabelModal>(
              currentValue: currentValue,
              hintText: hintText ?? 'Chọn',
              onChange: onChange,
              childs:items
                  .map<DropdownMenuItem<LabelModal>>(
                    (type) => DropdownMenuItem<LabelModal>(
                      value: type,
                      child: Text(
                        type.label ?? '', // Đảm bảo `type.label` là kiểu String
                        style: AppStyles.contentStyleV2,
                      ),
                    ),
                  )
                  .toList(),
            )),
        if (validationError.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 5),
            child: Text(
              validationError,
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
