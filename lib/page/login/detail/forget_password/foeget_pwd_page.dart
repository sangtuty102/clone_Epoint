import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:clone_epoint/page/login/detail/forget_password/forget_pwd_controller.dart';
import 'package:clone_epoint/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class ForgetPwdPage extends BaseLoginPage<ForgetPwdController> {
  @override
  ForgetPwdController get controller => Get.put(ForgetPwdController());

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
                AppStrings.labelRecoverPwd,
                style: Get.textTheme.headline3.copyWith(
                    color: AppColors.textBlue, fontWeight: FontWeight.bold),
              ).paddingSymmetric(vertical: AppDimens.paddingMedium),
              baseDivider(),
              Text(
                AppStrings.phonenumber,
                style:
                    Get.textTheme.headline5.copyWith(color: AppColors.textBlue),
              ).paddingSymmetric(vertical: AppDimens.paddingMedium),
              _buildTextHelper(),
              SizedBox(height: AppDimens.paddingHuge),
              _buildInputOTP(),
              SizedBox(height: AppDimens.paddingHuge),
              SizedBox(height: AppDimens.paddingHuge),
              _builButtonNext(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputOTP() {
    return BuildInputText(
      hintText: AppStrings.labelInputPhoneNumber,
      controller: controller.phoneTextController,
      currentNode: _phoneFocus,
      textInputType: TextInputType.number,
      iconNextTextInputAction: TextInputAction.done,
      maxLengthInputForm: 10,
      onlyNumber: true,
    );
  }

  Text _buildTextHelper() => Text(
        AppStrings.forgetPwdLabel,
        style: Get.textTheme.bodyText2.copyWith(color: Colors.grey),
      );

  Widget _builButtonNext() => baseButtonGradient(
        onPressed: controller.funcNext,
        child: Row(
          children: [
            Expanded(
              child: Text(
                AppStrings.continues,
                style: TextStyle(
                    color: Colors.white, fontSize: AppDimens.textBody),
              ),
            ),
            Icon(
              Icons.navigate_next_outlined,
              color: Colors.white,
            )
          ],
        ),
      );
}
