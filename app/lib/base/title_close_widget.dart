
import 'package:app/base/colors.dart';
import 'package:app/base/ratio_screen.dart';
import 'package:app/base/styles.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class TitleCloseWidget extends StatelessWidget {
  const TitleCloseWidget({Key? key, required this.title, this.colorText})
      : super(key: key);
  final String title;
  final Color? colorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.w,
        ),
        Center(
          child: Container(
            height: 3.w,
            width: 93.w,
            decoration: BoxDecoration(
              color: AppColors.border,
              borderRadius: BorderRadius.circular(10.w),
            ),
          ),
        ),
        SizedBox(
          height: 12.w,
        ),
        _titleWidget(),
      ],
    );
  }

  Widget _titleWidget() {
    return Stack(
      children: [
        Center(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: AppStyles.titleStyle.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: colorText ?? AppColors.caption),
          ),
        ),
        Positioned(
          child: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Container(
                  color: Colors.transparent,
                  child: const Icon(
                    Icons.clear,
                    color: AppColors.red,
                  ))),
          top: 0,
          right: 16.w,
        )
      ],
    );
  }
}
