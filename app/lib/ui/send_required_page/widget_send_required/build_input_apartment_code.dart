import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/input_text.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildInputApartmentCode extends StatelessWidget {
  const BuildInputApartmentCode({
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
          text: 'Mã căn hộ',
        ),
        InputTextVer2(
          hintText: 'Nhập mã căn hộ',
          controller: controller.apartmentCodeController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
        ),
        12.height


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