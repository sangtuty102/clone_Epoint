import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/app_colors.dart';
import 'package:clone_epoint/const/app_const.dart';
import 'package:clone_epoint/const/app_dimens.dart';
import 'package:clone_epoint/const/app_string.dart';
import 'package:clone_epoint/page/login/login_controller.dart';
import 'package:clone_epoint/utils/base_input.dart';
import 'package:clone_epoint/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends BaseLoginPage<LoginController> {
  @override
  LoginController get controller => Get.put(LoginController());

  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  @override
  Widget buildLogin() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(AppDimens.paddingBig, AppDimens.paddingBig,
            AppDimens.paddingBig, 0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  AppStrings.login,
                  style: Get.textTheme.headline3.copyWith(
                      color: AppColors.textBlue, fontWeight: FontWeight.bold),
                ).paddingSymmetric(vertical: AppDimens.paddingMedium),
                baseDivider(),
                SizedBox(height: AppDimens.paddingHuge),
                _buildInputPhone(),
                SizedBox(height: AppDimens.paddingHuge),
                _buildInputPassword(),
                SizedBox(height: AppDimens.paddingDefault),
                _buildForgetPassword(),
                SizedBox(height: AppDimens.paddingHuge),
                baseButtonGradient(
                  onPressed: controller.funcLogin,
                  child: Text(
                    AppStrings.login.toUpperCase(),
                    style:
                        Get.textTheme.bodyText1.copyWith(color: Colors.white),
                  ),
                ),
                SizedBox(height: AppDimens.paddingDefault),
                _buildNavtoRegister(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildInputPhone() {
    return BuildInputText(
      hintText: AppStrings.labelInputPhoneNumber,
      controller: controller.phoneTextController,
      currentNode: _phoneFocus,
      textInputType: TextInputType.number,
      maxLengthInputForm: 10,
      onlyNumber: true,
    );
  }

  Widget _buildInputPassword() {
    return BuildInputText(
      hintText: AppStrings.labelInputPassword,
      controller: controller.passwordTextController,
      currentNode: _passwordFocus,
      isPassword: true,
      textInputType: TextInputType.number,
      maxLengthInputForm: 6,
      onlyNumber: true,
      iconNextTextInputAction: TextInputAction.done,
    );
  }

  Row _buildForgetPassword() => Row(
        children: [
          Spacer(),
          GestureDetector(
            onTap: () => Get.toNamed(AppConst.routeForgetPwd),
            child: Text(
              AppStrings.forgetPassword,
              style: Get.textTheme.bodyText1.copyWith(color: Colors.redAccent),
            ),
          )
        ],
      );

  Row _buildNavtoRegister() => Row(
        children: [
          Spacer(),
          Text(
            AppStrings.labelNoAccout,
            style: Get.textTheme.bodyText1.copyWith(color: Colors.grey),
          ),
          SizedBox(width: AppDimens.paddingSmall),
          GestureDetector(
            onTap: () => Get.toNamed(AppConst.routeRegister),
            child: Text(
              AppStrings.labelRegisterNow,
              style: Get.textTheme.bodyText1.copyWith(color: Colors.redAccent),
            ),
          ),
          Spacer(),
        ],
      );
}
