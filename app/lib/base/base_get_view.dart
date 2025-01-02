
import 'package:app/base/base_getx_controller.dart';
import 'package:app/base/base_loading.dart';
import 'package:app/base/colors.dart';
import 'package:app/base/const.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum RefreshStatus { employee, customer, agency }

abstract class BaseGetWidget<T extends BaseGetXController> extends GetView<T>
    implements Bindings {
  const BaseGetWidget({Key? key}) : super(key: key);

  Widget buildViewLoading() {
    return Container(
      color: AppColors.bgDayPrice.withOpacity(0.6),
      child: Center(
        child: LoadingAppFlight(
            text: controller.isShowWarning ? WARNING_LOADING : null),
      ),
    );
  }

  Widget buildLoading({
    required Widget child,
    double? positionTop,
  }) {
    return Stack(
      children: <Widget>[
        child,
        Obx(() {
          return Positioned(
            bottom: 0,
            right: 0,
            top: positionTop ?? 0,
            left: 0,
            child: Visibility(
                visible: controller.isShowLoading.value,
                child: buildViewLoading()),
          );
        }),
      ],
    );
  }

  void handleDioError(String message, int statusCode) {
    controller.setLoading(false);
    if (statusCode == 401) {
      // DialogApp().showDialogNoti(
      //     title: Tran.tr.notify,
      //     content: message,
      //     onClick: () async {
      //       await StorageApp.clearAllStorage();
      //       Get.off(const HomePage());
      //       Get.delete<HomeController>();
      //       Get.offAll(() => const LoginPage());
      //     });
    } else {
      // DialogApp().showDialogNoti(
      //   title: Tran.tr.notify,
      //   content: message,
      // );
    }
  }

  @override
  void dependencies() {}
}
