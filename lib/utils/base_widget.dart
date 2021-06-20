import 'package:clone_epoint/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget baseButtonGradient(
    {@required Widget child, @required Function onPressed}) {
  return GestureDetector(
    onTap: onPressed,
    child: Container(
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        gradient: LinearGradient(
          colors: <Color>[
            Color(0xFF42A5F5),
            Color(0xFF0D47A1),
          ],
        ),
      ),
      padding: EdgeInsets.all(AppDimens.paddingDefault),
      alignment: Alignment.center,
      child: child,
    ),
  );
}

Widget baseDivider() => Container(
      width: 100,
      height: 5,
      decoration: BoxDecoration(
        color: Colors.yellow[900],
        borderRadius: BorderRadius.circular(20),
      ),
    );

Text titleBanner() => Text(
      AppStrings.labelSafePower,
      style: Get.textTheme.headline6.copyWith(color: AppColors.textBlue),
    );
