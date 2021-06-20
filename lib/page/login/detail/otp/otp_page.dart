import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:clone_epoint/page/login/detail/otp/otp_controller.dart';
import 'package:clone_epoint/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class OTPPage extends BaseLoginPage<OTPController> {
  @override
  OTPController get controller => Get.put(OTPController());

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
              titleBanner(),
              SizedBox(height: AppDimens.paddingDefault),
              baseDivider(),
              Text(
                AppStrings.labelInputOTP,
                style: Get.textTheme.headline5.copyWith(
                    color: AppColors.textBlue, fontWeight: FontWeight.bold),
              ).paddingSymmetric(vertical: AppDimens.paddingMedium),
              _buildTextHelper(),
              Text(controller.phoneNumber, style: Get.textTheme.bodyText2),
              SizedBox(height: AppDimens.paddingHuge),
              _buildInputOTP(),
              SizedBox(height: AppDimens.paddingHuge),
              SizedBox(height: AppDimens.paddingHuge),
              _buildBottomView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputOTP() {
    return BuildInputText(
      hintText: AppStrings.labelInputOTP,
      controller: controller.otoTextController,
      currentNode: _phoneFocus,
      textInputType: TextInputType.number,
      iconNextTextInputAction: TextInputAction.done,
      maxLengthInputForm: 6,
      onlyNumber: true,
    );
  }

  Text _buildTextHelper() => Text(
        AppStrings.otpLabel,
        style: Get.textTheme.bodyText2.copyWith(color: Colors.grey),
      );

  Row _buildBottomView() => Row(
        children: [
          GestureDetector(
            onTap: controller.changPhoneNumber,
            child: Text(
              AppStrings.otpChangePhone,
              style: Get.textTheme.bodyText1.copyWith(color: Colors.redAccent),
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () => controller.funcSendOTP,
            child: Text(
              AppStrings.otpResend,
              style: Get.textTheme.bodyText1.copyWith(color: Colors.redAccent),
            ),
          ),
        ],
      );
}
