import 'package:app/base/colors.dart';
import 'package:app/base/input_text.dart';
import 'package:app/base/spacing_extension.dart';
import 'package:app/base/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildInputNumberBedRoom extends StatelessWidget {
  const BuildInputNumberBedRoom({
    super.key,
    required this.controller,
  });

  final SendRequiredPageController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextNoneRequired(
          text: 'Số phòng ngủ',
        ),
        InputTextVer2(
          textInputType: TextInputType.number,
          hintText: 'Nhập số phòng ngủ',
          controller: controller.numberBedRoomController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
          inputFormatters: [
            //  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,5}$')),
            // DecimalInputFormatter(decimalRange: 5),
          ],
        ),
        12.height,
      ],
    );
  }
}

// class DecimalInputFormatter extends TextInputFormatter {
//   final int decimalRange;

//   DecimalInputFormatter({this.decimalRange = 5});

//   @override
//   TextEditingValue formatEditUpdate(
//       TextEditingValue oldValue, TextEditingValue newValue) {
//     String newText = newValue.text;
//     if (newText.contains('.')) {
//       int decimalIndex = newText.indexOf('.');
//       if (newText.length - decimalIndex - 1 > decimalRange) {
//         newText = newText.substring(0, decimalIndex + decimalRange + 1);
//       }
//     }
//     return newValue.copyWith(text: newText);
//   }
// }
