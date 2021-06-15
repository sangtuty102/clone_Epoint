import 'package:clone_epoint/base/base.dart';
import 'package:clone_epoint/const/const.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

Box HIVE_APP;

/// Biến để lưu trữ, đọc dữ liệu (nhanh hơn Hive, tránh trường hợp lỗi key chưa được khởi tạo)
// ignore: non_constant_identifier_names
GetStorage APP_DATA = GetStorage();

class AppController extends GetxController {
  bool isOpened = true;
  @override
  void onInit() {
    isOpened = APP_DATA.read(AppConst.keyInitOpenApp) ?? false;
    initHive().then((value) {
      Get.put(BaseRequest(), permanent: true);

      Get.put(BaseGetxController(), permanent: true);

      Get.offNamed(isOpened ? AppConst.routeLogin : AppConst.routeSplash);
    });

    super.onInit();
  }

  Future<void> initHive() async {
    WidgetsFlutterBinding.ensureInitialized();
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    HIVE_APP = await Hive.openBox(AppStrings.appName);
  }
}
