import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ConfirmPwdController extends BaseGetxController {
  TextEditingController pwdTextController = TextEditingController();
  TextEditingController confirmTextController = TextEditingController();
  String phoneNumber = '';
  @override
  void onInit() {
    var arg = Get.arguments;
    if (arg != null && arg is String) phoneNumber = arg;
    super.onInit();
  }

  Future<void> funcSavePwd() async {
    //TODO  check pwd ==confirm , gửi lưu Password
    showLoading();
    await 3.seconds.delay().whenComplete(() => hideLoading());
    // TODO: call xem đúng chưa đưa thoong báo, hoặc chuyển màn set lại newPwd
    Get.offAllNamed(AppConst.routeLogin);
  }
}
