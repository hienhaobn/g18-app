import 'package:app/base_hieu/assets.dart';
import 'package:app/base_hieu/colors.dart';
import 'package:app/base_hieu/styles.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final Color buttonColor;
  final Color textColor;
  final Color disableColor;
  final double radius;
  final double? width;
  final double? height;
  final String? icon;
  final bool disable;
  final bool isShowGradient;
  const BottomButton(
      {Key? key,
      required this.onTap,
      required this.title,
      this.radius = 8,
      this.buttonColor = AppColors.p4C28A5,
      this.disableColor = AppColors.unActive,
      this.textColor = Colors.white,
      this.disable = false,
      this.isShowGradient = true,
      this.width,
      this.height,
      this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: disable ? disableColor : buttonColor,
        // gradient: disable
        //     ? null
        //     : isShowGradient
        //         ? gradientApp
        //         : null,
      ),
      child: InkWell(
        onTap: disable ? null : onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: AppStyles.normalStyle.copyWith(
                fontWeight: FontWeight.w700,
                color: textColor,
                fontFamily: 'Lato-Bold',
              ),
            ),
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: AppAssets.svgIcon(icon ?? "", color: Colors.white),
              )
          ],
        ),
      ),
    );
  }
}