import 'package:app/base/colors.dart';
import 'package:app/base/input_text.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/base/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetNewInputIOS extends StatelessWidget {
  const WidgetNewInputIOS({
    super.key,
     this.controller,
    // required this.focusNode,
    required this.title,
    required this.hint,  this.titleStyle, this.textInputFormatter, this.hintStyle,
  });

  final TextEditingController? controller;
  // final FocusNode focusNode;
  final String title;
  final String hint;
  final TextStyle? titleStyle;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? textInputFormatter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          // 'Diện tích (m²)'
          title,
          style:titleStyle ?? AppStyles.contentStyleV2
              .copyWith(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        4.height,
        InputText(
          textInputType: TextInputType.text,
          fillColor: AppColors.nDDDDDD,
          hintText:
              // 'Nhập diện tích (m²)'
              hint,
          hintStyle: hintStyle??
          TextStyle(fontSize: 15)
          ,
          controller: controller,
          // focusNode: focusNode,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          inputFormatters:textInputFormatter ?? [
            FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,4}')),
            //  LengthLimitingTextInputFormatter(10), // Thay đổi giới hạn độ dài nếu cần
          ],
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10), // Bo viền 15
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: AppColors.p4C28A5),
            borderRadius: BorderRadius.circular(10), // Bo viền 15
          ),
        ),
      ],
    );
  }
}
