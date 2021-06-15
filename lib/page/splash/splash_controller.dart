import 'package:clone_epoint/app/app.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  RxInt currentPage = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  void navtoLoginPage() {
    Get.offAndToNamed(AppConst.routeLogin);
    APP_DATA.write(AppConst.keyInitOpenApp, true);
  }
}
