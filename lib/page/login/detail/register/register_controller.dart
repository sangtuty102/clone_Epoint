import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/app_const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends BaseGetxController {
  TextEditingController phoneTextController = TextEditingController();

  void funcNext() {
    //TODO: call lấy mã OTP
    // navtoOTP
    Get.toNamed(AppConst.routeOTP, arguments: phoneTextController.text.trim());
  }
}
