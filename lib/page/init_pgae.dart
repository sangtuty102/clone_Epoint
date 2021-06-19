import 'package:clone_epoint/app/app.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitPage extends GetView<AppController> {
  @override
  Widget build(BuildContext context) {
    Get.put(AppController());
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      child: SizedBox(
        height: 100,
        child: Image.asset(AppStrings.imgLogoApp),
      ),
    );
  }
}
