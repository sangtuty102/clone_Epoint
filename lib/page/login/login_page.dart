import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/app_dimens.dart';
import 'package:clone_epoint/page/login/login_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends BaseLoginPage<LoginController> {
  @override
  LoginController get controller => Get.put(LoginController());

  @override
  Widget buildLogin() {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: AppDimens.paddingDefault,
          ),
          Text('Đăng nhập')
        ],
      ),
    );
  }
}
