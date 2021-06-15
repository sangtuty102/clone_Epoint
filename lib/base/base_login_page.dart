import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class BaseLoginPage<T extends BaseGetxController>
    extends BaseGetWidget {
  Widget buildLogin();
  @override
  Widget buildWidgets() {
    return SafeArea(
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
                Expanded(child: SizedBox()),
                ClipOval(
                        child: Image.asset(AppStrings.imgBackground,
                            height: 100, fit: BoxFit.fill))
                    .paddingSymmetric(
                        vertical: AppDimens.paddingHuge,
                        horizontal: AppDimens.paddingDefault),
                Expanded(
                  child: FlatButton.icon(
                      onPressed: () {
                        //TODO: urlLunch call
                      },
                      icon: Icon(Icons.headset_mic_outlined),
                      label: Text('Hỗ trợ')),
                )
              ],
            ),
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
    );
  }
}
