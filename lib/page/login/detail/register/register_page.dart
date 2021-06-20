import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:clone_epoint/page/login/detail/register/register_controller.dart';
import 'package:clone_epoint/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class RegisterPage extends BaseLoginPage<RegisterController> {
  @override
  RegisterController get controller => Get.put(RegisterController());

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
                AppStrings.phonenumber,
                style: Get.textTheme.headline5.copyWith(
                    color: AppColors.textBlue, fontWeight: FontWeight.bold),
              ).paddingSymmetric(vertical: AppDimens.paddingMedium),
              _buildTextHelper().paddingOnly(right: 5),
              SizedBox(height: AppDimens.paddingHuge),
              _buildInputPhone(),
              SizedBox(height: AppDimens.paddingHuge),
              _builButtonNext(),
              SizedBox(height: AppDimens.paddingDefault),
              _buildNavtoLogin(),
            ],
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
      iconNextTextInputAction: TextInputAction.done,
      maxLengthInputForm: 10,
      onlyNumber: true,
    );
  }

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

  Text _buildTextHelper() => Text(
        AppStrings.labelRegisterTextHelper,
        style: Get.textTheme.bodyText2.copyWith(color: Colors.grey),
      );

  Row _buildNavtoLogin() => Row(
        children: [
          Spacer(),
          Text(
            AppStrings.labelHaveAccout,
            style: Get.textTheme.bodyText1.copyWith(color: Colors.grey),
          ),
          SizedBox(width: AppDimens.paddingSmall),
          GestureDetector(
            onTap: () => Get.back(),
            child: Text(
              AppStrings.labelLoginNow,
              style: Get.textTheme.bodyText1.copyWith(color: Colors.redAccent),
            ),
          ),
          Spacer(),
        ],
      );
}
