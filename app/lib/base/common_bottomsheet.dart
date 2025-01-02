import 'package:app/base/bottom2button.dart';
import 'package:app/base/styles.dart';
import 'package:app/main.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future showCommonBottomSheet2(Widget child,
    {bool isScrollControlled = false,
    void Function()? onClose,
    BoxConstraints? constraints,
    Color? backgroundColor,
    AnimationController? animationController,
    RouteSettings? settings,
    bool isDismissible = true}) async {
  totalCurrentBtnShow++;
  logger.i("showCommonBottomSheet ${child.toString()}");
  var res = await Get.bottomSheet(
      BottomSheet(
        backgroundColor: backgroundColor,
        onClosing: () {},
        constraints: constraints ??
            BoxConstraints(
                maxHeight: Get.height - Get.mediaQuery.viewPadding.top),
        animationController: animationController,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        builder: (context) {
          return child;
        },
      ),
      isScrollControlled: isScrollControlled,
      settings: settings,
      isDismissible: isDismissible);
  totalCurrentBtnShow--;
  onClose?.call();
  return res;
}

void showCommonConfirm({
  required String title,
  required String subTitle,
  required void Function() onTap,
  Widget? child,
}) {
  showCommonBottomSheet(Container(
    padding: EdgeInsets.only(bottom: Get.mediaQuery.viewPadding.bottom + 10),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              title,
              style: AppStyles.bigStyle,
            ),
          ),
          Text(subTitle),
          if (child != null) child,
          SizedBox(
            height: 16,
          ),
          Bottom2button(onTap2: onTap)
        ],
      ),
    ),
  ));
}

Future showCommonBottomSheet(
  Widget child, {
  bool isScrollControlled = false,
  void Function()? onClose,
  BoxConstraints? constraints,
  Color? backgroundColor,
  AnimationController? animationController,
  RouteSettings? settings,
  bool isDismissible = true,
  bool enableDrag = true,
}) async {
  logger.i("showCommonBottomSheet ${child.toString()}");
  totalCurrentBtnShow++;
  var res = await Get.bottomSheet(
    Container(
      constraints: constraints ??
          BoxConstraints(
            maxHeight: Get.height - Get.mediaQuery.viewPadding.top,
          ),
      child: child,
    ),
    isScrollControlled: isScrollControlled,
    backgroundColor: backgroundColor ?? Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    enableDrag: enableDrag,
    isDismissible: isDismissible,
  );
  totalCurrentBtnShow--;
  onClose?.call();
  return res;
}
