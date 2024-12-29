import 'package:another_flushbar/flushbar.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Future<void> showFlushBar(
    {required String content,
    Duration? duration,
    Color backgroundColor = Colors.green,
    void Function()? onClose}) async {
  // Future.delayed(Duration(milliseconds: 100)).then((value) {

  // });
  await Future.delayed(Duration(milliseconds: 100));
  await Flushbar(
    message: content,
    flushbarStyle: FlushbarStyle.GROUNDED,
    flushbarPosition: FlushbarPosition.TOP,
    backgroundColor: backgroundColor,
    duration: duration ?? Duration(seconds: 3),
  ).show(Get.context!);
  onClose?.call();
}
