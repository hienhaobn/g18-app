import 'package:app/base/bottom_button.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/ratio_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class Bottom2button extends StatelessWidget {
  final String? title1;
  final String? title2;
  final void Function()? onTap1;
  final void Function() onTap2;
  final Widget? icon2Button;
  final Color? color2Button;
  final double? space;
  final Color? color1Button;
  final Color? textColor1;
  final Color? textColor2;
  final bool disableBtn2;
  const Bottom2button(
      {Key? key,
      this.title1,
      this.title2,
      this.onTap1,
      required this.onTap2,
      this.color1Button,
      this.color2Button,
      this.textColor1,
      this.textColor2,
      this.space,
      this.disableBtn2 = false,
      this.icon2Button})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: BottomButton(
                textColor: textColor1 ?? AppColors.blackText,
                buttonColor: color1Button ?? AppColors.hint,
                onTap: () {
                  if (onTap1 != null) {
                    onTap1!.call();
                  } else {
                    Get.back();
                  }
                },
                title: title1 ?? 'Hủy')),
        SizedBox(
          width: space ?? 24.w,
        ),
        Expanded(
          child: icon2Button != null
              ? CommonIconButton(
                  
                  onTap: onTap2,
                  title: title2 ?? 'Hủy',
                  buttonColor: color2Button,
                  icon: icon2Button!)
              : _buildButton2(),
        ),
      ],
    );
  }

  Widget _buildButton2() {
    return BottomButton(
      textColor: textColor2 ?? AppColors.white,
        onTap: () {
          onTap2();
        },
        buttonColor: color2Button ?? AppColors.p4C28A5,
        disable: disableBtn2,
        title: title2 ?? 'Lưu');
  }
}
