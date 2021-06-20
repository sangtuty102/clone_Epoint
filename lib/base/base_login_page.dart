import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class BaseLoginPage<T extends BaseGetxController>
    extends BaseGetWidget {
  Widget buildLogin();
  @override
  Widget buildWidgets() {
    return baseShowLoading(
      () => SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AppStrings.imgBackground),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GestureDetector(
                        onTap: () => Get.back(),
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                          color: Colors.white,
                        ).paddingAll(AppDimens.paddingDefault),
                      ),
                    ),
                  ),
                  SizedBox(
                          child: Image.asset(AppStrings.imgLogoEVN,
                              height: 120, fit: BoxFit.cover))
                      .paddingSymmetric(
                          vertical: 35, horizontal: AppDimens.paddingDefault),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlatButton.icon(
                        onPressed: () {
                          //TODO: urlLunch call
                        },
                        icon: Icon(Icons.headset_mic_outlined),
                        label: Text(AppStrings.help),
                      ).paddingOnly(right: AppDimens.paddingDefault),
                    ),
                  )
                ],
              ).paddingOnly(top: AppDimens.paddingDefault),
              Expanded(
                  child: Container(
                width: double.infinity,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                    color: Color(0xF0F0F0F0),
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(40),
                    )),
                child: buildLogin(),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
