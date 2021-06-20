import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:clone_epoint/page/login/login_repository.dart';
import 'package:clone_epoint/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends BaseGetxController {
  LoginRepository _loginRepository;
  LoginController() {
    _loginRepository = LoginRepository();
  }

  TextEditingController phoneTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();
  final formKey = GlobalKey<FormState>(); //dùng bắt validate

  Future<void> funcLogin() async {
    KeyBoard.hide();
    showLoading();
    await 3.seconds.delay().whenComplete(() => hideLoading());
    // TODO: xử lí logic cho các trường hợp
    // LoginResponse response = await _loginRepository
    //     .sendLogin(
    //         phoneTextController.text.trim(), passwordTextController.text.trim())
    //     .whenComplete(() => hideLoading());

    // if (response.code == "success") {}

    Get.offAllNamed(AppConst.routeHome);
  }
}
