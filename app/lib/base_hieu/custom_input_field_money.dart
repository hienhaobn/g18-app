import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/font_controller.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MoneyInputField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final void Function(String)? onChanged;
  final String label;
   String? priceLable;
   final TextStyle? hintStyle;
   final String? Function(String?)? validator;
   

  MoneyInputField({
    required this.controller,
    required this.hintText,
    this.onChanged, required this.label,  this.priceLable,this.hintStyle, this.validator
  });

  @override
  _MoneyInputFieldState createState() => _MoneyInputFieldState();
}

class _MoneyInputFieldState extends State<MoneyInputField> {
  late FocusNode _focusNode;

  final FontController fontController = Get.put(FontController());

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    // Đặt con trỏ về cuối mỗi khi ô input được focus
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // Đặt con trỏ ở cuối
        widget.controller.selection = TextSelection.collapsed(offset: widget.controller.text.length);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              widget.label,
              style: fontController.currentFontStyle
              // TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            5.width,
            // Obx(
            //   () => 
              Text(
                widget.priceLable ??'',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              // ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        TextFormField(
          validator:widget.validator ,
          controller: widget.controller,
          focusNode: _focusNode,  // Gắn focusNode vào TextField
          keyboardType: TextInputType.number,
          textAlign: TextAlign.end,
          
          inputFormatters: [
          
            FilteringTextInputFormatter.digitsOnly,
            TextInputFormatter.withFunction((oldValue, newValue) {
              final oldText = oldValue.text.replaceAll('.', '');
              final newText = newValue.text.replaceAll('.', '');

              // Tính toán vị trí con trỏ trước khi định dạng
              final cursorPositionBefore = newValue.selection.end;

              final numericValue = int.tryParse(newText);
              String formattedValue = newText;  // Khởi tạo giá trị mặc định

              if (numericValue != null) {
                formattedValue = NumberFormat("#,###", "en_US")
                    .format(numericValue)
                    .replaceAll(',', '.'); // Đổi dấu phẩy thành dấu chấm
              }

              // Tính toán sự chênh lệch độ dài trước và sau khi định dạng
              final lengthDifference = formattedValue.length - newText.length;

              // Vị trí con trỏ mới sau khi định dạng khi thêm số
              final newCursorPosition =
                  (cursorPositionBefore + lengthDifference).clamp(0, formattedValue.length);

              // Trường hợp khi xóa số
              if (newText.length < oldText.length) {
                // Nếu xóa, ta di chuyển con trỏ về cuối
                return TextEditingValue(
                  text: formattedValue,
                  selection: TextSelection.collapsed(offset: formattedValue.length),
                );
              }

              return TextEditingValue(
                text: formattedValue,
                selection: TextSelection.collapsed(offset: newCursorPosition),
              );
            }),
          ],
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: widget.hintStyle,
            filled: true, // Kích hoạt màu nền
            fillColor: AppColors.border, // Màu nền xám
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Viền bo góc 8 khi không focus
              borderSide: BorderSide(
                color: AppColors.border, // Viền xám nhạt khi không focus
                // Độ dày viền khi không focus
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // Viền bo góc 8 khi focus
              borderSide: BorderSide(
                color: AppColors.p4C28A5, // Màu tím khi focus
                width: 2, // Độ dày viền khi focus
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          ),
          onChanged:  widget.onChanged,
          // (value) {
          //   // Cập nhật giá trị cho priceLable khi giá trị trong TextField thay đổi
          //   widget.priceLable?.value = widget.controller.text;
          //   if (widget.onChanged != null) {
          //     widget.onChanged!(value); // Gọi hàm onChanged nếu có
          //   }
          // },
          
        ),
        // const SizedBox(height: 16),
      ],
    );
  }
}
