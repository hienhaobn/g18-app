import 'dart:async';

import 'package:get/get.dart';

abstract class BaseGetXController extends GetxController {
  RxBool isShowLoading = false.obs;
  Timer? _timer;
  int? _start;
  bool isShowWarning = false;
  @override
  void onInit() {
    print('init $this');
    super.onInit();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _start = 59;
    _timer?.cancel();
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start! <= 0) {
          timer.cancel();
          setLoading(false);
        } else {
          _start = _start! - 1;
        }
      },
    );
  }

  void setLoading(bool isShow, {bool isShowWarning = false}) {
    this.isShowWarning = isShowWarning;
    isShowLoading.value = isShow;
    if (isShow) {
      startTimer();
    } else {
      _timer?.cancel();
    }
  }
}
