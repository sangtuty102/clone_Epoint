import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OTPController extends BaseGetxController {
  TextEditingController otoTextController = TextEditingController();
  String phoneNumber = '';
  @override
  void onInit() {
    var arg = Get.arguments;
    if (arg != null && arg is String) phoneNumber = arg;
    otoTextController.addListener(() async {
      if (otoTextController.text.length == 6) {
        showLoading();
        await 3.seconds.delay().whenComplete(() => hideLoading());
        // TODO: call xem đúng chưa đưa thoong báo, hoặc chuyển màn set lại newPwd
        Get.offNamed(AppConst.routeConfirmPwd, arguments: arg);
      }
    });
    super.onInit();
  }

  void funcSendOTP() {
    //TODO  gửi lại OTP
  }
  void changPhoneNumber() => Get.back();
}
