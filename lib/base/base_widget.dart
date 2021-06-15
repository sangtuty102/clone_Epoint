import 'package:clone_epoint/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'base.dart';

abstract class BaseGetWidget<T extends BaseGetxController> extends GetView<T> {
  const BaseGetWidget({Key key}) : super(key: key);

  Widget buildWidgets();

  @override
  Widget build(BuildContext context) {
    controller.onError();
    return WillPopScope(
        // tắt tính năng vuốt trái để back lại màn hình trước đó trên iphone
        onWillPop: () async {
          KeyBoard.hide();
          await 300.milliseconds.delay();
          return !Navigator.of(context).userGestureInProgress;
        },
        child: buildWidgets());
  }
}
