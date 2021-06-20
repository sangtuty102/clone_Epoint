import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPwdController extends BaseGetxController {
  TextEditingController phoneTextController = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  Future<void> funcNext() async {
    //TODO  gửi lại OTP
    // checkxem đúng định dạng số đt chưa, check số đã đk chưa
    showLoading();
    await 3.seconds.delay().whenComplete(() => hideLoading());
    Get.toNamed(AppConst.routeOTP);
  }
}
