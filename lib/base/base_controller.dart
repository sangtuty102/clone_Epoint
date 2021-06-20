import 'package:clone_epoint/const/app_string.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base.dart';

class BaseGetxController extends GetxController {
  RxBool isShowLoading = false.obs;
  RxBool isLoadedSuccess = false.obs;
  String errorContent = '';
  BaseRequest baseRequestController = Get.find();

  /// Sử dụng một số màn bắt buộc sử dụng loading overlay
  RxBool isLoadingOverlay = false.obs;

  void showLoading() {
    isShowLoading.value = true;
  }

  void hideLoading() {
    isShowLoading.value = false;
    isLoadedSuccess.value = true;
  }

  void showLoadingOverlay() {
    isLoadingOverlay.value = true;
  }

  void hideLoadingOverlay() {
    isLoadingOverlay.value = false;
  }

  void onError() {
    baseRequestController.setOnErrorListener((error) {
      errorContent = AppStrings.errorConnectFailedStr;

      if (error is DioError) {
        switch (error.type) {
          case DioErrorType.connectTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
            errorContent = AppStrings.errorConnectTimeout;
            BaseRequest.dio.close();
            break;
          case DioErrorType.response:
            switch (error.response.statusCode) {
              case AppConst.error404:
                errorContent = AppStrings.error404;
                break;

              default:
                errorContent = AppStrings.errorInternalServer;
            }
            break;
          default:
            errorContent = AppStrings.errorConnectFailedStr;
        }
      }

      print('errorContent -> $errorContent');
      print('error -> $error');
      isShowLoading.value = false;
      isLoadingOverlay.value = false;
      // if (errorContent.isNotEmpty) showSnackBar(errorContent);
      if (errorContent.isNotEmpty) {
        Get.defaultDialog(
            title: AppStrings.notify,
            content: Text(errorContent),
            textCancel: AppStrings.cancel);
      }
    });
  }

  Future<void> showSnackBar(String message,
      {Duration duration = const Duration(seconds: 2)}) async {
    Get.showSnackbar(GetBar(
      backgroundColor: AppColors.darkAccentColor,
      messageText: Text(
        message,
        style: Get.textTheme.bodyText1,
      ),
      message: message,
      duration: message.length > 500 ? 5.seconds : duration,
    ));
  }
}
