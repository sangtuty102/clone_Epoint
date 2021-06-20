import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:clone_epoint/page/login/detail/confirm_password/confirm_pwd_controller.dart';
import 'package:clone_epoint/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ConfirmPwdPage extends BaseLoginPage<ConfirmPwdController> {
  @override
  ConfirmPwdController get controller => Get.put(ConfirmPwdController());

  final FocusNode _phoneFocus = FocusNode();

  @override
  Widget buildLogin() {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(AppDimens.paddingBig, AppDimens.paddingBig,
            AppDimens.paddingBig, 0),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppStrings.labelCreatePwd,
                style: Get.textTheme.headline3.copyWith(
                    color: AppColors.textBlue, fontWeight: FontWeight.bold),
              ).paddingSymmetric(vertical: AppDimens.paddingMedium),
              baseDivider(),
              SizedBox(height: AppDimens.paddingHuge),
              _buildTextHelper(),
              Text(controller.phoneNumber, style: Get.textTheme.bodyText2),
              SizedBox(height: AppDimens.paddingHuge),
              _buildInputPwd(),
              SizedBox(height: AppDimens.paddingHuge),
              _buildInputPwdConfirm(),
              SizedBox(height: AppDimens.paddingHuge),
              _builButtonSave(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputPwd() {
    return BuildInputText(
      hintText: AppStrings.labelInputPassword,
      controller: controller.pwdTextController,
      currentNode: _phoneFocus,
      textInputType: TextInputType.number,
      iconNextTextInputAction: TextInputAction.done,
      maxLengthInputForm: 6,
      onlyNumber: true,
    );
  }

  Widget _buildInputPwdConfirm() {
    return BuildInputText(
      hintText: AppStrings.labelInputPasswordConfirm,
      controller: controller.confirmTextController,
      currentNode: _phoneFocus,
      textInputType: TextInputType.number,
      iconNextTextInputAction: TextInputAction.done,
      maxLengthInputForm: 6,
      onlyNumber: true,
    );
  }

  Text _buildTextHelper() => Text(
        AppStrings.labelConfirmPwdTextHelper,
        style: Get.textTheme.bodyText2.copyWith(color: Colors.grey),
      );

  Widget _builButtonSave() => baseButtonGradient(
        onPressed: controller.funcSavePwd,
        child: Text(
          AppStrings.continues,
          style: TextStyle(color: Colors.white, fontSize: AppDimens.textBody),
        ),
      );
}
