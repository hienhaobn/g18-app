import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/input_text.dart';
import 'package:app/base_hieu/spacing_extension.dart';
import 'package:app/base_hieu/text_required.dart';
import 'package:app/ui/send_required_page/send_required_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildInputBuildingFloor extends StatelessWidget {
  const BuildInputBuildingFloor({
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
          text: 'Tòa / Khu',
        ),
        InputTextVer2(
          hintText: 'Nhập tòa / khu',
          controller: controller.buildingAreaController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
          inputFormatters: [
          ],
        ),
        12.height,
           TextNoneRequired(
          text: 'Tầng / Dãy',
        ),
        InputTextVer2(
          hintText: 'Nhập tầng / dãy',
          controller: controller.rowFloorController,
          fillColor: AppColors.border,
          padding: EdgeInsets.symmetric(horizontal: 15),
          inputFormatters: [
          ],
        ),
        12.height,


      ],
    );
  }
}


